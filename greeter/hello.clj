(ns hello)

(let [concated-args (apply str *command-line-args*)]
  (println (str "Hello, " concated-args)))
