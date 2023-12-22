(define (cons-bis x y) (lambda (m) (m x y)))

(define (car-bis z)
    (z (lambda (p q) p)))

(define (cdr-bis z)
    (z (lambda (p q) q)))
