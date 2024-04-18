(load "ch-3/ex-3-25.scm")

(define (operator exp) (car exp)) 
(define (operands exp) (cdr exp))

(define table (make-table))

(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
          ((variable? exp) (lookup-variable-value exp env))
          ((and (pair? exp) ((table 'lookup-proc) (list (car exp)))) 
            (((table 'lookup-proc) (list (car exp))) exp env))
          ((application? exp) 
            (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
           (else (error "Unknown expression type: EVAL" exp))))

(define (install-quote-package)

(define (text-of-quotation exp) (cadr exp))

((table 'insert-proc!) 
    (list 'quote) 
    (lambda (exp env) (text-of-quotation exp)))
    
    'done)

(define (install-assignment-package)

(define (assignment-variable exp) (cadr exp)) 
(define (assignment-value exp) (caddr exp))
(define (eval-assignment exp env) (set-variable-value! (assignment-variable exp)
                       (eval (assignment-value exp) env)
                       env)
'ok)

((table 'insert-proc!) 
    (list 'set!) 
    eval-assignment)
    
    'done)


(install-quote-package)
(install-assignment-package)