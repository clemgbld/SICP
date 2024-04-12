(load "test-manager/load.scm")
(load "functions/functions.scm")
(load "functions/streams.scm")
(load "ch-3/ex-3-81.scm")



(define-each-test
(check (equal? '() (stream->list (stream-take (rand the-empty-stream 0 inc)  2))) "should be an empty stream when there is not requests")
(check (equal? '(1) (stream->list (stream-take (rand (list->stream (list (list 'generate))) 0 inc)  2))) "should geneate a random number")
(check (equal? '(2) (stream->list (stream-take (rand (list->stream (list (list 'reset 2))) 0 inc)  1))) "should be able to reset the random numbers stream when there is a reset request")
(check (equal? '(3) (stream->list (stream-take (rand (list->stream (list (list 'reset 3))) 0 inc)  1))) "should be able to reset the random numbers stream when there is a reset request")
(check (equal? '(1 2 6 7) (stream->list (stream-take (rand (list->stream (list (list 'generate) (list 'generate) (list 'reset 6) (list 'generate))) 0 inc)  4))) "should be able to generate a stream of multiple random numbers")
)



(run-registered-tests)