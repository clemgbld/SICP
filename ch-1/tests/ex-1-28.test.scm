(load "test-manager/load.scm")
(load "ch-1/ex-1-28.scm")

(define-each-test
(assert-true (fast-prime? 2 100) "should be a prime")
(assert-true (fast-prime? 89 100) "should be a prime")
(assert-true (fast-prime? 97 100) "should be a prime")
(assert-false (fast-prime? 15 100) "should not be a prime")
(assert-false (fast-prime? 561 100) "should not be a prime")
(assert-false (fast-prime? 1105 100) "should not be a prime")
(assert-false (fast-prime? 1729 100) "should not be a prime"))



(run-registered-tests)