(define (fast-expt b n) 
(expt-iter b n 1)) 

(define (expt-iter b counter product) 
(cond ((= counter 0) product) 
 ((is-even? counter) 
 (expt-iter (square b)
 (/ counter  2) 
product))
 (else (expt-iter b 
 (- counter 1) 
 (* b product)))))

(define (is-even? n)
  (= (remainder n 2) 0))

