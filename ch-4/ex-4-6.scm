(load "ch-4/ex-4-4.scm")

(define (let-body exp) (caddr exp))
(define (let-vars exp) (map car (cadr exp)))
(define (let-exps exp) (map cadr (cadr exp)))

(define (let->combination exp)
    (list (make-lambda 
        (let-vars exp) 
        (let-body exp)) 
    (let-exps exp)))

(define (install-let-package)

(define (eval-let exp env)
    (eval (let->combination exp) env))

((table 'insert-proc!) 
    (list 'let) 
    eval-let)
    
    'done)

(install-let-package)



