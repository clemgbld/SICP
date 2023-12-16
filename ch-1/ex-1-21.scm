(load "functions/functions.scm")

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor) 
(cond ((> (square test-divisor) n) n)
((divides? test-divisor n) test-divisor)
(else (find-divisor n (inc test-divisor)))))

(trace find-divisor)

(display (smallest-divisor 199))
(display (smallest-divisor 1999))
(display (smallest-divisor 19999))

