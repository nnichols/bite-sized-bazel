(ns toolchains.clojure.pwd)

(defn -main
  [& _args]
  (let [directory (System/getProperty "user.dir")]
    (println {:directory directory})))
