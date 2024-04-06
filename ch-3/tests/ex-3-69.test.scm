(load "test-manager/load.scm")
(load "ch-3/ex-3-69.scm")


(define-each-test
(check (equal? (list (list 1 1 1)) (stream->list (stream-take (triples integers integers integers) 1))) "should get the first element of the triples stream")
(check (equal? (list (list 1 1 1) (list 1 1 2)) (stream->list (stream-take (triples integers integers integers) 2))) "should get the two first elements of the triples stream")
(check (equal? (list (list 1 1 1) (list 1 1 2) (list 2 2 2)) (stream->list (stream-take (triples integers integers integers) 3))) "should get the two first elements of the triples stream")
(check (equal? (list (list 1 1 1) (list 1 1 2) (list 2 2 2) (list 1 2 2)) (stream->list (stream-take (triples integers integers integers) 4))) "should get the two first elements of the triples stream")
)

(define-each-test
(check (equal? (list (list 3 4 5) (list 6 8 10)) (stream->list (stream-take pythagorean-triples 2))) "should generate a list of the first two pythagorean triples")
)



(run-registered-tests)