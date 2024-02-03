
(define (deriv exp var) 
(cond ((number? exp) 0)
    ((variable? exp) 
    (if (same-variable? exp var) 1 0)) 
    (else ((get 'deriv (operator exp))
        (operands exp) var)))) 
        
(define (operator exp) (car exp)) 
(define (operands exp) (cdr exp))


;a We transform the deriv procedure from a type dispatch kind of procedure to a data directed dispatch one
;We can't assimilate the predicates number? and variable? because they don't have an operator

;b 
;c

(define (intall-sum-package)

(define (deriv-sum exp var) 
    (make-sum (deriv (addend exp) var)
            (deriv (augend exp) var)))

(put 'deriv '(+) deriv-sum)
'done)

(define (install-product-package)
(define (deriv-product exp var)
 (make-sum (make-product
            (multiplier exp)
            (deriv (multiplicand exp) var))
            (make-product
            (deriv (multiplier exp) var)
            (multiplicand exp))))

(put 'deriv '(*) deriv-product)
'done)


(define (install-expoentiation-package)

(define (deriv-exponentiation exp var)
 (make-product 
                (make-product (exponent exp) 
                (make-exponentiation (base exp) 
                (make-sum (exponent exp) '-1))) 
                    (deriv (base exp) var)))

(put 'deriv '(**) deriv-exponentiation)

'done)

;d we would have to switch 'deriv and the operators of place in the put procedure