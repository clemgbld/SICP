(define (negate x) 
    (apply-generic 'negate (type-tag x) (contents x)))

(define (install-package-scheme-number)
    (put 'negate '(scheme-number) (lambda (x) ( - x )))'done)

(define (install-package-rational)
    (put 'negate '(rational) (lambda (r) (make-rat (- (numer r)) (denom r))))'done)

(define (install-package-real)
    (put 'negate '(real) (lambda (x) (- x)))'done)

(define (install-package-complex)
    (put 'negate '(complex) (lambda (c) (make-from-real-imag (- (real c) (- (imag c))))))'done)

(define (intall-package-poly)

(define (negate-terms l) 
    (map (lambda (t) (make-term (order t) (negate (coeff t)))) l))

 (define (negate-poly p) 
   (make-poly (variable p) (negate-terms (term-list p)))) 

 (define (sub-poly p1 p2) 
   (if (same-variable? (variable p1) (variable p2)) 
       (add-poly p1 (negate-poly p2)) 
       (error "Polys not in the same var: SUB-POLY" 
              (list p1 p2)))) 

 (put 'sub '(polynomial polynomial) 
      (lambda (p1 p2) (tag (sub-poly p1 p2)))) 

'done)
