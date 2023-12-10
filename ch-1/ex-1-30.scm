(define (sum-integers a b) 
(sum identity a inc b))

; linear recursive sum
;(define (sum term a next b) 
;(if (> a b) 0
;(+ (term a)
;   (sum term (next a) next b))))

; iterative sum

(define (sum term a next b) 
(define (iter a result)
(if (> a b) result
(iter (next a) (+ (identity a) result)))) 
(iter a 0))

(define (identity x) x)

(define (inc x) (+ 1 x))