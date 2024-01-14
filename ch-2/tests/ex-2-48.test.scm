(load "test-manager/load.scm")
(load "ch-2/ex-2-48.scm")

(define-each-test 
(check (equal? (make-vect 0 2) (start-segment (make-segment (make-vect 0 2) (make-vect 1 3)))) "should select the start vector of the segment")
(check (equal? (make-vect 0 3) (end-segment (make-segment (make-vect 0 0) (make-vect 0 3)))) "should select the start vector of the segment")
)

(run-registered-tests)