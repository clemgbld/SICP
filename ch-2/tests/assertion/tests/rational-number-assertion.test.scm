(load "test-manager/load.scm")
(load "ch-2/tests/assertion/rational-number-assertions.scm")

(define-each-test
(assert-true (string=?  (rat-to-string (make-rat 1 2)) (rat-to-string (make-rat 1 2))) "should be true when numerator and denomniator or the same")
(assert-false (string=?  (rat-to-string (make-rat 2 3)) (rat-to-string (make-rat 1 3))) "should be false when numerator is not equal")
(assert-false (string=?  (rat-to-string (make-rat 1 2)) (rat-to-string (make-rat 1 3))) "should be false when denominator is not equal"))

(run-registered-tests)