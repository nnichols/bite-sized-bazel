(ns doc-hub.copy
  "Copies files from the execRoot into the workspace"
  (:require
   [clojure.java.io :as io]
   [clojure.string :as str]
   [clojure.tools.cli :as cli]))

(def create-file
  "Create a file, and, if necessary, all of its parent directories.
   Similar to chaining `mkdir -p` and `touch`"
  (comp io/make-parents io/file))

(def bazel-artifact-directory
  "bazel-bin/")

(defn copy-file
  "Copies the artifact from `source-file` to `output`"
  [source-file output]
  (let [source-filename      (str bazel-artifact-directory source-file)
        content              (slurp source-filename)
        destination-filename (str output)]
    (println (format "Copying %s to %s" source-filename destination-filename))
    (create-file destination-filename)
    (spit destination-filename content)))


(defn -main
  [& args]
  (let [cli-arguments (cli/parse-opts args
                                      ;; the `--data` flag comes from `clojure_binary` rule
                                    [["-data FILE"
                                      "--data FILE"
                                      "A file, relative to where Bazel artifacts are generated, which needs to be copied."
                                      :default ""]
                                     ["-output FILE"
                                      "--output FILES"
                                      "The filepath where the artifact should be copied to. Relative to the workspace directory."
                                      :default ""]])
        source-filepath (get-in cli-arguments [:options :data])
        output-filepath (get-in cli-arguments [:options :output])]
    (assert (not (str/blank? source-filepath)))
    (assert (not (str/blank? output-filepath)))
    (copy-file source-filepath output-filepath)))
