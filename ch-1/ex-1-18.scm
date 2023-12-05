(define (multiply a b) 
(multiply-iter a b 0))

(define (multiply-iter a count product) 
(cond ((= count 0) product)
((is-even? count) (multiply-iter 
(double a) 
(/ count 2) product))
(else (multiply-iter a 
(- count 1) 
(+ product a)))))


(define (is-even? n)
  (= (remainder n 2) 0))

(define (double n) 
(+ n n))