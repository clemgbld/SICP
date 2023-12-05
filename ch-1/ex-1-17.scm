(define (multiply a b) (cond ((= b 0) 0)
      ((is-even? b) (multiply (double a) (/ b 2)))
      (else (+ a (multiply a (- b 1))))))


(define (is-even? n)
  (= (remainder n 2) 0))

(define (double n) 
(+ n n))
