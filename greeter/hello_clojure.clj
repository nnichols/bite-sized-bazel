(ns greeter.hello-clojure
  (:require [libraries.stdlib.clojure.strings :as strs]))

(defn -main
  [& args]
  (let [basis    "Hello, "
        greeting (strs/concat-array args)]
    (println (str basis greeting))))
