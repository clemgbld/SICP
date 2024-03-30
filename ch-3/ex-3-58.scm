(load "functions/streams.scm")

(define (expand num den radix)
    (cons-stream 
        (quotient (* num radix) den)
        (expand (remainder (* num radix) den) den radix)))

;It is a long division stream 
; each nth item of the stream will be the quotient of the numerator multiplied by the radix and the denominator
; while nth + 1 will be the same thing but with a new numerator which will be the remainder of the numerator multiplied by the radix and the denominator 

(define S0 (expand 1 7 10))
; 1, 4, 2, 8, 5, 7, 1, 4, 2, 8, 5, 7, and the process will go like this indefinitely    

(define S1 (expand 3 8 10))
; 3, 7, 5, 0, 0 keep going with zereos