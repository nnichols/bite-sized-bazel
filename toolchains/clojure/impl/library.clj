(ns toolchains.clojure.impl.library
  "Implementation code behind `//toolchains/clojure:clojure_library.bzl`.
   This code loads all of the declared dependencies into a JAR for consumption in other JVM-hosted consumers."
  (:require
   [clojure.java.io :as io]
   [clojure.tools.cli :as cli]
   [clojure.string :as str])
  (:import
   (java.io
    BufferedOutputStream
    FileOutputStream
    PushbackReader)
   (java.util.jar
    JarEntry
    JarFile
    JarOutputStream
    Manifest)))

(defn ->ns-symbol
  "Grab the symbolic name, if it exists, from a namespace declaration s-expression.

   e.g. `(->ns-symbol (quote (ns toolchains.clojure.impl.library))` => `toolchains.clojure.impl.library`"
  [form]
  (and (list? form)
       (= 'ns (first form))
       (second form)))

(defn file->ns-symbol
  "Open a file and return the namespace's symbol.

   e.g. `(file->ns-symbol \"toolchains/clojure/impl/library.clj\")` => `toolchains.clojure.impl.library`"
  [file]
  (with-open [reader (PushbackReader. (io/reader file))]
    (->> #(read {:read-cond :preserve} reader)
         repeatedly
         (some ->ns-symbol))))

(defn file->short-path
  "Load the file to extract the namespace symbol, and then convert it to a shortpath file name."
  [file]
  (let [file-name      (.getName file)
        file-extension (re-find #"\.clj[c]?$" file-name)]
    (-> file
        file->ns-symbol
        name
        (.replace \- \_)
        (.replace \. \/)
        (str file-extension))))

(defn file-path
  "Convert file paths with paths relative to the BUILD root."
  [build-location file]
  (let [pattern (re-pattern (format "^%s/" build-location))]
    (if (re-find pattern (.getPath file))
      (str/replace (.getPath file) pattern "")
      (.getName file))))

(def command-line-options
  "Defines the command-line options which can be passed into this script.
   Supports 4 flags:

     - `--build-location`: The directory containing the location of the build
     - `--jar`: The target location of the produced JAR
     - `--src`: A source code file to load into the JAR.
                Can be repeated, defaults to `[]`
     - `--data`: Static files to be loaded as JAR resources.
                 Can be repeated, defaults to `[]`

   See: https://github.com/clojure/tools.cli/blob/v1.2.245/README.md#example-usage"
  [[nil "--build-location DIRECTORY"]
   [nil "--jar PATH"]
   [nil "--src FILE" "Source files to compile"
    :multi true
    :default []
    :update-fn conj]
   [nil "--data FILE" "Static contents to load into the produced JAR"
    :multi true
    :default []
    :update-fn conj]])

(let [{:keys [src data jar build-location]}
      (:options (cli/parse-opts *command-line-args* command-line-options))]
  (def build-location build-location)
  (def compile-jar (io/file jar))
  (def sources (map io/file src))
  (def data (map io/file data)))

(def manifest
  "Load the JAR Manifest file content."
  (let [m (Manifest.)]
    (doto (.getMainAttributes m)
      (.putValue "Manifest-Version" "1.0"))
    m))

(defn put-next-entry!
  "Loads the `target` JAR with the new `name`'d entry."
  [target name]
  (.putNextEntry target (doto (JarEntry. name) (.setTime 0))))

(defn path-segments
  "Construct the path segments to a file.

   e.g. `(path-segments \"some/path/file.clj\")` => `(\"some\" \"path\")`"
  [path]
  (butlast (str/split path #"/")))

(defn all-subdirectories
  "Accumulate all subdirectories implied by the `path-segments`.

   e.g. `(all-subdirectories [\"some\" \"path\"])` => `#{\"some/\" \"some/path/\"}`"
  ([path-segments]
   (all-subdirectories path-segments #{}))
  ([path-segments acc]
   (if path-segments
     (let [path (str (clojure.string/join "/" path-segments) "/")]
       (all-subdirectories (butlast path-segments) (conj acc path)))
     acc)))

(def directories
  "The compiled list of all directories and subdirectories which will be added to the JAR."
  (->> (concat (map file->short-path sources)
               (map (partial file-path build-location) data))
       (mapcat (comp all-subdirectories path-segments))
       set))

(with-open [jar-output-stream (-> compile-jar FileOutputStream. BufferedOutputStream. JarOutputStream.)]

  ; Load the JAR Manifest
  (put-next-entry! jar-output-stream JarFile/MANIFEST_NAME)
  (.write manifest jar-output-stream)
  (.closeEntry jar-output-stream)

  ; Load all source code files as-is
  ; In clojure, libraries are source code containers
  ; Consuming applications and libraries chose the compilation strategy to convert them into bytecode
  (doseq [file sources]
    (put-next-entry! jar-output-stream (file->short-path file))
    (io/copy file jar-output-stream)
    (.closeEntry jar-output-stream))

  ; Load all Bazel data dependencies
  (doseq [file data]
    (put-next-entry! jar-output-stream (file-path build-location file))
    (io/copy file jar-output-stream)
    (.closeEntry jar-output-stream))

  ; Load all directory paths for Classpath navigation
  (doseq [dir directories]
    (put-next-entry! jar-output-stream dir)))
