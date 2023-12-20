(load "test-manager/load.scm")
(load "ch-2/tests/assertion/rational-number-assertions.scm")
(load "ch-2/ex-2-1.scm")

(define-each-test 
(check-rat (make-rat 2 3) (make-rat 6 9) "should reduce rational number")
(check-rat (make-rat 2 3) (make-rat -2 -3) "should normalize rational number sign")
(check-rat (make-rat -2 3) (make-rat 2 -3) "should normalize rational number sign")
(check-rat (make-rat 2 -4) (make-rat -1 2) "should normalize rational number sign")
(check-rat (make-rat -2 4) (make-rat -1 2) "should normalize rational number sign")
)

(run-registered-tests)