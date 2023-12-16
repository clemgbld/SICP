(load "functions/functions.scm")

(define (repeated fn n)
(define initial-fn fn)
    (define (recur fn n x) 
    (cond ((< n 1) x)
        ((= n 1) (fn x))
        (else (recur (compose initial-fn fn) (dec n) x))))
        (lambda (x) (recur fn n x)))