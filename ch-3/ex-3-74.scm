(load "functions/streams.scm")

(define sense-data (stream-append (list->stream (list 1 2 1.5 1 0.5 -0.1 -2 -3 -2 -0.5 0.2 3 4)) integers))

(define (sign-change-detector current-value last-value)
    (cond ((and (< current-value 0) (>= last-value 0)) -1) 
        ((and (>= current-value 0) (< last-value 0)) 1)
        (else 0)))

(define zero-crossings 
(stream-map 
    sign-change-detector 
    sense-data 
    (cons-stream 0 sense-data)))