(load "test-manager/load.scm")
(load "ch-2/ex-2-1.scm")

(define (is-rat-equal x y) 
    ( and 
        (= (numer x) (numer y)) 
            (= (denom x) (denom y))))

(define (check-rat x y message)
(assert-true (is-rat-equal x y) message))

(define-each-test
(assert-true (is-rat-equal (make-rat 1 2) (make-rat 1 2)) "should be true when numerator and denomniator or the same")
(assert-false (is-rat-equal (make-rat 1 3) (make-rat 2 3)) "should be false when numerator is not equal")
(assert-false (is-rat-equal (make-rat 1 2) (make-rat 1 3)) "should be false when denominator is not equal"))

(define-each-test 
(check-rat (make-rat 2 3) (make-rat 6 9) "should reduce rational number")
)




(run-registered-tests)