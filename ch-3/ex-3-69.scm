(load "functions/streams.scm")

 (define (triples s t u)
     (cons-stream (list (stream-car s) (stream-car t) (stream-car u)) 
            (interleave 
                (stream-map (lambda (x) (cons (stream-car s) x)) (stream-cdr (pairs t u)))
                (triples (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define pythagorean-triples 
(stream-filter 
    (lambda (triple) (= (square (caddr triple)) (+ (square (cadr triple) ) (square (car triple))))) 
    (triples integers integers integers)))