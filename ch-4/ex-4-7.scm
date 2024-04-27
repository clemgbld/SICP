(load "functions/functions.scm")
(load "ch-4/ex-4-6.scm")

;let* is equivalent to :

;(let ((⟨var1⟩ ⟨exp1⟩) ⟨body⟩)
;let ((⟨var2⟩ ⟨exp2⟩) ⟨body⟩)
;...(let n)))

(define (let*-vars exp) (cadr exp))
(define (let*-body exp) (caddr exp))
(define (make-let vars body)
    (list 'let vars body))

(define (let*->nested-lets exp)
    (fold-right (lambda (curr acc)
                (make-let 
                    (list curr) 
                    acc))
        (let*-body exp) 
        (let*-vars exp)))

(define (install-let*-package)

(define (eval-let* exp env)
    (eval (let*->nested-lets exp) env))

((table 'insert-proc!) 
    (list 'let*) 
    eval-let*)
    
    'done)

(install-let*-package)

;it does not matter whether we convert let* into let or into lambda directly