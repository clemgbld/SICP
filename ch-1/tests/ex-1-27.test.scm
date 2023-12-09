(load "test-manager/load.scm")
(load "ch-1/ex-1-27.scm")

(define-each-test
(assert-false (prime? 1) "1 should not be a prime")
(assert-false (prime? 0) "0 should not be a prime")
(assert-true (prime? 89) "1 should be a prime number")
(assert-true (prime? 561) "should fool the fermat test"))


(run-registered-tests)