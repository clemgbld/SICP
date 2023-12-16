(load "functions/functions.scm")

(define (sum-square-of-prime-numbers-between start end)
(filtered-sum square start inc end prime?))

(define (factorial-of-relatively-prime-number-between start end)
(define (filter? x) 
(relatively-prime? x end))
(filtered-product identity start inc end filter?))

(define (filtered-sum term a next b filter?) 
(filtered-accumulate + 0 term a next b filter?))

(define (relatively-prime? i n) 
(if (< i 0) #f 
(= 1 (gcd i n))))

(define (filtered-product term a next b filter?) 
(filtered-accumulate * 1 term a next b filter?))

(define (filtered-accumulate combiner null-value term a next b filter?) 
(if (> a b) null-value 
(combiner (if (filter? a) (term a) 
null-value) 
(filtered-accumulate combiner null-value term (next a) next b filter?))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (+ test-divisor 1)))))








