
(define (make-if predicate consequent alternative)
        (list 'if predicate consequent alternative))

(define (unless-predicate exp)
    (cadr exp))

(define (unless-consequent exp)
    (if (null? (cdddr exp)) 
        #f 
        (cadddr exp)))

(define (unless-alternative exp)
    (caddr exp))


(define (unless->if exp)
    (make-if 
        (unless-predicate exp) 
        (unless-consequent exp) 
        (unless-alternative exp)))

;(define (unless? exp) (tagged-list? exp 'unless))

;add in analyze
;((unless? exp) (analyze (unless->if exp)))

;Like Alyssa said the usefulness of implementing unless as a procedure instead of a special form is that we can use unless in higher order procedure for example
;let's say that you have a if procedure that is also lazy like unless you can use a higher order function that would take either one of this procedure



