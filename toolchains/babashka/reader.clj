(ns reader
  (:require
   [clojure.edn :as edn]
   [clojure.java.io :as io]))

(let [{:keys [data out-file]} (edn/read-string (first *command-line-args*))
      content (mapv slurp data)]
  (spit (io/file out-file) {:content content}))
