(load "test-manager/load.scm")
(load "ch-1/ex-1-30.scm")

(define-each-test
 (check ( = 1 (sum-integers 0 1))  "the sum should be 1")
 (check ( = 21 (sum-integers 0 6))  "the sum should be 21"))



(run-registered-tests)