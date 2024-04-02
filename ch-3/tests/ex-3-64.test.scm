(load "test-manager/load.scm")
(load "ch-3/ex-3-64.scm")


(define-each-test
(check (equal? the-empty-stream (stream-limit the-empty-stream 0.5)) "it should be an empty stream when the stream is empty")
(check (equal? 1 (stream-limit (cons-stream 1 the-empty-stream) 0.5)) "it should be the last element of the stream when the tolerence is not achieve before the end of the stream")
(check (equal? 0.3 (stream-limit (cons-stream 0.4 (cons-stream 0.3 the-empty-stream)) 0.2)) "it should be the second element of the stream when the tolerance is achieved")
(check (equal? 0.33 (stream-limit (cons-stream 0.6 (cons-stream 0.3 (cons-stream 0.33 the-empty-stream))) 0.1)) "it should take the element of the stream when the tolerance is achieve")
)



(run-registered-tests)