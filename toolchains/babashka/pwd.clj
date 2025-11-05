(ns pwd
  (:require
   [clojure.edn :as edn]
   [clojure.java.io :as io]))

(let [{:keys [out-file]} (edn/read-string (first *command-line-args*))
      directory (System/getProperty "user.dir")]
  (spit (io/file out-file) {:directory directory}))
