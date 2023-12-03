(define (pascal c r) 
(cond ((is-out-of-bound c r) #f) 
((is-edge c r) 1)
(else (+ (pascal (dec c) (dec r)) 
(pascal c (dec r))))))

(define (is-out-of-bound c r) 
(or (> c r) (< c 1)))

(define (is-edge c r) 
(or (= c 1) (= c r)))

(define (dec n) 
(- n 1))
