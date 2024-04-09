(load "test-manager/load.scm")
(load "ch-3/ex-3-74.scm")



(define-each-test
(check (equal? '(0 0 0 0 0 -1 0 0 0 0 1 0 0) (stream->list (stream-take zero-crossings 13))) "should generate a zero corssings stream")
)



(run-registered-tests)