(ns libraries.stdlib.clojure.strings-test
  (:require [libraries.stdlib.clojure.strings :as sut]
            [clojure.test :refer :all]))

(deftest concat-array-test
  (is (= "" (sut/concat-array [])))
  (is (= "hello" (sut/concat-array ["hello"])))
  (is (= "hello testing" (sut/concat-array ["hello" " testing"]))))
