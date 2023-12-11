(load "test-manager/load.scm")
(load "ch-1/ex-1-32.scm")

(define-each-test
 (check ( = 1 (factorial 1))  "the factorial should be 1")
 (check ( = 720 (factorial 6))  "the factorial should be 720")
)

(define-each-test
 (check ( = 1 (sum-integers 0 1))  "the sum should be 1")
 (check ( = 21 (sum-integers 0 6))  "the sum should be 21"))



(run-registered-tests)