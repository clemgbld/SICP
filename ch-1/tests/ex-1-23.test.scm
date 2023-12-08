(load "test-manager/load.scm")
(load "ch-1/ex-1-23.scm")

(define-each-test
(check (= 2 (find-divisor 2 2)) "should be 2")
(check (= 3 (find-divisor 9 3)) "should be 3"))

(define-each-test
(check (= 3 (next 2)) "should be 3")
(check (= 5 (next 3)) "should be 5"))


(run-registered-tests)