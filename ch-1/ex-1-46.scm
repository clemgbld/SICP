(load "functions/functions.scm")

(define (iterative-improve good-enough? impove-guess)
    (lambda (first-guess) 
    (define (try guess)
                (let ((next (impove-guess guess)))
                    (if (good-enough? guess next)
                        next
                        (try next))))
                            (try first-guess)))

(define tolerance 0.00001)

 (define (close-enough? v1 v2) 
        (< (abs (- v1 v2))
            tolerance))

(define (fixed-point f first-guess)
    ((iterative-improve close-enough? f) first-guess))


(define (sqrt x)
((iterative-improve close-enough? (average-damp (lambda (y) (/ x y)))) 1.0))

