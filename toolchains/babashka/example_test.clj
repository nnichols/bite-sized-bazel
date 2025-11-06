(ns example-test
  (:require [clojure.test :refer :all]))

(deftest unit-test
  (testing "A demonstrative unit test"
    (is (= 1 1))))

(run-test unit-test)
