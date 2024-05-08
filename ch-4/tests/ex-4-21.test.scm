(load "test-manager/load.scm")
(load "ch-4/ex-4-21.scm")

(define-each-test
(assert-false (f 5) "should not be even")
(assert-true (f 6) "should be even")
)



(run-registered-tests)