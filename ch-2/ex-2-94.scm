(load "ch-2/ex-2-91.scm")

 (define (gcd a b) 
   (apply-generic 'gcd a b)) 

(define intall-package-poly

(define (remainder-terms a b) 
    (cadr (div-terms (term-list a) (term-list b))))
    

(define (gcd-terms a b) (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))


(define (gcd-poly p1 p2)
(if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (gcd-terms (term-list p1) (term-list p2)))
(error "Polys not in same var: GCD-POLY" (list p1 p2))))

(put 'gcd '(polynomial polynomial) (lambda (a b) (tag (gcd-poly a b))))

'done)

(define (intall-package-scheme-number)

(define (gcd a b) (if (= b 0)
      a
      (gcd b (remainder a b))))


(put 'gcd '(scheme-number scheme-number) gcd)
)