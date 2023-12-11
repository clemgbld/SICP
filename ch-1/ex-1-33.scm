
(define (sum-square-of-prime-numbers-between start end)
(filtered-sum square start inc end prime?))

(define (filtered-sum term a next b filter?) 
(filtered-accumulate + 0 term a next b filter?))

(define (filtered-accumulate combiner null-value term a next b filter?) 
(if (> a b) null-value 
(combiner (if (filter? a) (term a) 
null-value) 
(filtered-accumulate combiner null-value term (next a) next b filter?))))

(define (product term a next b) 
(accumulate * 1 term a next b))

(define (accumulate combiner null-value term a next b) 
(if (> a b) null-value 
(combiner (term a) 
(accumulate combiner null-value term (next a) next b))))

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

(define (divides? a b)
  (= (remainder b a) 0))

(define (inc x) (+ x 1))



