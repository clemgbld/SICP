(load "test-manager/load.scm")
(load "ch-3/ex-3-8.scm")

(define-each-test
(check (= 1 (F 1)) "should be the number passed in params when the procedure has not been called before")
)

(define-each-test
(check (= 0 (F 1)) "should be zero if the procedure has already been called before")
)

(run-registered-tests)