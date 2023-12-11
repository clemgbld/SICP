(load "test-manager/load.scm")
(load "ch-1/ex-1-33.scm")

(define-each-test
 (check ( = 208 (sum-square-of-prime-numbers-between 2 11))  "should be the sum of the prime nubmers"))


(run-registered-tests)