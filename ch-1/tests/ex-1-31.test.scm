(load "test-manager/load.scm")
(load "ch-1/ex-1-31.scm")

(define-each-test
 (check ( = 1 (factorial 1))  "the factorial should be 1")
 (check ( = 720 (factorial 6))  "the factorial should be 720")
)



(run-registered-tests)