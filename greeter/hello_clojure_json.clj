(ns greeter.hello-clojure-json
  (:require [libraries.stdlib.clojure.strings :as strs]
            [cheshire.core :as json]))

(defn -main
  [& args]
  (let [basis         "Hello, "
        greeting      (str basis (strs/concat-array args))
        json-greeting (json/generate-string {:greeting greeting})]
    (println json-greeting)))
