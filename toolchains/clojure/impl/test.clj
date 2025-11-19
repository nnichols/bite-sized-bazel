(require '[clojure.test :as test])
(require '[clojure.java.io :as io])
(import (java.io PushbackReader))

(defn ->ns-symbol
  "Grab the symbolic name, if it exists, from a namespace declaration s-expression.

   e.g. `(->ns-symbol (quote (ns toolchains.clojure.impl.test))` => `toolchains.clojure.impl.test`"
  [form]
  (and (list? form)
       (= 'ns (first form))
       (second form)))

(defn file->ns-symbol
  "Open a file and return the namespace's symbol.

   e.g. `(file->ns-symbol \"toolchains/clojure/impl/test.clj\")` => `toolchains.clojure.impl.test`"
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

(def sources
  "The actual files containing the test source code."
  (map io/file *command-line-args*))

;; Statefully load all files
(doseq [source sources]
  (load-file (.getCanonicalPath source)))

;; Execute all `deftest` forms. If any tests fail, or return errors, we exist with code 1
;; This informs Bazel that the tests have failed
(let [test-namespaces      (map file->short-path sources)
      {:keys [fail error]} (apply test/run-tests (map file->ns-symbol test-namespaces))]
  (when-not (= 0 fail error)
    (System/exit 1)))
