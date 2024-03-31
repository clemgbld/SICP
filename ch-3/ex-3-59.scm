(load "functions/streams.scm")
(load "functions/functions.scm")


(define (integrate-series s)
    (stream-map / s integers))

(define sine-series 
    (cons-stream 0 (integrate-series)))

(define cosine-series
    (cons-stream 1 (integrate-series (stream-map negate sine-series))))

