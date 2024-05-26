(define (require p) (if (not p) (amb)))


(define (an-integer-starting-from n)
(amb n (an-integer-starting-from (+ n 1))))


;solution one
(define (an-integer-between low high)
    (let ((num (an-integer-starting low)))
        (require (and (>= num low) (<= num high)))
        num))

;solution 2
(define (an-integer-between low high)
        (require (<= num low high))
        (amb low (an-integer-between (+ low 1) high)))