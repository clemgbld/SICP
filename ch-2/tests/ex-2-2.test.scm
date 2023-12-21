(load "test-manager/load.scm")
(load "ch-2/ex-2-2.scm")

(define-each-test 
(check (equal? (make-point 4 2) (midpoint-segment (make-segment (make-point 5 1) (make-point 3 3)))) "should find the midpoint of a segment"))

(run-registered-tests)