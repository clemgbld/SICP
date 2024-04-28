(load "ch-4/ex-4-4.scm")

(define (let-body exp) (caddr exp))
(define (named-let-body exp) (cadddr exp))
(define (let-named-var exp) (cadr exp))
(define (let-vars exp) (map car (cadr exp)))
(define (let-exps exp) (map cadr (cadr exp)))
(define (let-named-vars exp) (map car (caddr exp)))
(define (let-named-exps exp) (map cadr (caddr exp)))
(define (named-let? exp) (symbol? (cadr exp)))
(define (make-define parameters body)
    (list 'define parameters body))
(define (make-define-proc-params name params)
    (cons name params))

(define (call-proc name params)
    (cons name params))

(define (let->combination exp)
    (if (named-let? exp) 
        (make-begin 
            (list (make-define 
                        (make-define-proc-params 
                            (let-named-var exp) 
                            (let-named-vars exp)) 
                        (named-let-body exp))
                  (call-proc (let-named-var exp) 
                             (let-named-exps exp))))
        (list (make-lambda 
            (let-vars exp) 
            (let-body exp)) 
        (let-exps exp))))

(define (install-let-package)

(define (eval-let exp env)
    (eval (let->combination exp) env))

((table 'insert-proc!) 
    (list 'let) 
    eval-let)
    
    'done)

(install-let-package)