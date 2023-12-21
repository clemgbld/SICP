(load "test-manager/load.scm")
(load "ch-2/ex-2-2.scm")

(define-each-test 
(check (equal? (make-point 4 4) (midpoint-segment (make-point 5 3) (make-point 3 5))) "should find the midpoint of a segment"))

(run-registered-tests)