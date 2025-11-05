(ns hello-json
  (:require [cheshire.core :as json]))

(let [concated-args (apply str *command-line-args*)
      greeting (str "Hello, " concated-args)]
  (println (json/generate-string {:greeting greeting})))
