(load "test-manager/load.scm")
(load "functions/streams.scm")


(define-each-test
(check (equal? '(1) (stream->list (stream-take integers 1))) "should take the first element of the stream")
(check (equal? '(1 2 3) (stream->list (stream-take integers 3))) "should take the first three element of the stream")
(check (equal? the-empty-stream (stream->list (stream-take the-empty-stream 50))) "should handle finite stream")
)



(run-registered-tests)