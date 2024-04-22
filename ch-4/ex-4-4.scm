(load "ch-4/ex-4-3.scm")
(define (null-exps? seq) (null? seq))
(define (last-exp? seq) (null? (cdr seq))) 
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))
(define (make-if predicate consequent alternative)
        (list 'if predicate consequent alternative))


(define (or->if exp)
    (if (null-exps? exp) 
        #f
        (make-if 
            (first-exp exp) 
            (first-exp exp)
            (make-nested-if (rest-exps exp)))))

(define (and->if exp)
    (if (null-exps? exp)
        #t
        (make-if
            (list 'not (first-exp exp))
            #f
            (if (last-exp? exp) 
                (first-exp exp)
                (make-reverse-nested-if (rest-exps exp))))))


(define (install-or-package)

(define (eval-or exp env)
    (eval-if (or->if exp) env))

((table 'insert-proc!) 
    (list 'if) 
    eval-or)
    
    'done)

(define (install-and-package)

(define (eval-and exp env)
    (eval-if (and->if exp) env))

((table 'insert-proc!) 
    (list 'if) 
    eval-and)
    
    'done)

(install-or-package)
(install-and-package)
