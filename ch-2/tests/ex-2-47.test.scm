(load "test-manager/load.scm")
(load "ch-2/ex-2-47.scm")

(define-each-test 
(check (equal? (make-vect 2 5) (origin (make-frame (make-vect 2 5) (make-vect 0 0) (make-vect 0 0)))) "should select the origin")
(check (equal? (make-vect 1 2) (edge1 (make-frame (make-vect 2 5) (make-vect 1 2) (make-vect 0 0)))) "should select the edge1")
(check (equal? (make-vect 0 0) (edge2 (make-frame (make-vect 2 5) (make-vect 1 2) (make-vect 0 0)))) "should select the edge2")
)

(define-each-test 
(check (equal? (make-vect 2 5) (origin (make-frame-bis (make-vect 2 5) (make-vect 0 0) (make-vect 0 0)))) "should select the origin")
(check (equal? (make-vect 1 2) (edge1 (make-frame-bis (make-vect 2 5) (make-vect 1 2) (make-vect 0 0)))) "should select the edge1")
(check (equal? (make-vect 0 0) (edge2-bis (make-frame-bis (make-vect 2 5) (make-vect 1 2) (make-vect 0 0)))) "should select the edge2")
)

(run-registered-tests)