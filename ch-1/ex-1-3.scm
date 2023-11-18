(define (square x) (* x x))

(define (sum-square x y) (+ (square x) (square y)))

(define (sum-square-of-the-2-larger-numbers x y z)
  (cond ((and (>= x z) (> y z)) (sum-square x y))
        ((and (> y x) (> z x)) (sum-square y z))
        (else (sum-square x z))))