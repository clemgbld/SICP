(define (factorial n) 
(product  identity 1 inc n))

(define (pi-approximation n) 
(* (product pi-term 1 inc n) 4))

;linear recursive product
;(define (product term a next b) 
;(if (> a b) 1
;(* (term a)
;   (product term (next a) next b))))

;iterative product
(define (product term a next b) 
(define (iter a result)
(if (> a b) result
(iter (next a) (* (term a) result)))) 
(iter a 1))

 (define (pi-term n) 
   (if (even? n) 
       (/ (+ n 2) (+ n 1)) 
       (/ (+ n 1) (+ n 2)))) 

(define (identity x) x)

(define (inc x) (+ x 1))


(pi-approximation 6)