(define (letrec-vars exp) (cadr exp))
(define (letrec-var-name exp) (car exp))
(define (unassigned-var var) (list (letrec-var-name var) '*unassigned*))
(define (assign-var var) (cons 'set! var))
(define (letrec-body exp) (cddr exp))

;a)

(define (letrec->let exp)
     (cons 'let 
        (cons (map unassigned-var (letrec-vars exp))
     (append (map assign-var (letrec-vars exp)) 
        (letrec-body exp)))))

