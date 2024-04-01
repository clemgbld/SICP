(load "ch-3/ex-3-60.scm")
(load "functions/functions.scm")

(define (invert-unit-series s)
    (cons-stream 
        1 
        (mul-series 
            (stream-map negate (stream-cdr s)) 
            (invert-unit-series s))))