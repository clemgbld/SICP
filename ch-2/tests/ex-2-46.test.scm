(load "test-manager/load.scm")
(load "ch-2/ex-2-46.scm")

(define-each-test 
(check (equal? (make-vect 2 5) (add-vect (make-vect 1 2) (make-vect 1 3))) "should add two vector together")
(check (equal? (make-vect 0 1) (sub-vect (make-vect 1 3) (make-vect 1 2)))"should sub the fist vector by the second one")
(check (equal? (make-vect 2 4) (scale-vect 2 (make-vect 1 2))) "should multiply a vector by a scalar")
)

(run-registered-tests)