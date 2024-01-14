(load "test-manager/load.scm")
(load "ch-2/ex-2-48.scm")

(define-each-test 
(check (equal? (make-vect 0 2) (start-segment (make-segment 2 5))) "should select the start vector of the segment")
(check (equal? (make-vect 0 3) (end-segment (make-segment 1 3))) "should select the start vector of the segment")
)

(run-registered-tests)