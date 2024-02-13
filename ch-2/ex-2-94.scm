(load "ch-2/ex-2-91.scm")

 (define (greatest-common-divisor a b) 
   (apply-generic 'gcd a b)) 


(define (remainder-terms a b) 
    (cadr (div-terms (term-list a) (term-list b))))
    

(define (gcd-terms a b) (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))


(define (variable x) (car x))

(define (term-list x) (cadr x))

(define (gcd-poly p1 p2)
(if (same-variable? (variable p1) (variable p2))
      (make-poly (variable p1)
                 (gcd-terms (term-list p1) (term-list p2)))
(error "Polys not in same var: GCD-POLY" (list p1 p2))))

(define intall-package-poly


(put 'greatest-common-divisor '(polynomial polynomial) (lambda (a b) (tag (gcd-poly a b))))

'done)

(define (gcd a b) (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (intall-package-scheme-number)

(put 'greatest-common-divisor  '(scheme-number scheme-number) gcd)
)