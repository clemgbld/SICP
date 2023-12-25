(load "test-manager/load.scm")
(load "ch-2/ex-2-12.scm")

(define-each-test 
(check (= 2.55 (lower-bound (make-center-percent 3 15))) "should get the lower bound of the interval")
(check (= 3.45 (upper-bound (make-center-percent 3 15))) "should get the upper-bound bound of the interval")
(check (= 3 (center (make-center-percent 3 15))) "should get the center of the interval")
(check (= 15.000000000000005 (percent (make-center-percent 3 15))) "should get the percent of the interval"))

(run-registered-tests)