(load "ch-3/ex-3-25.scm")
(load "ch-4/ex-4-1-left-to-right.scm")

(define (operator exp) (car exp)) 
(define (operands exp) (cdr exp))
(define (application? exp) (pair? exp))

(define table (make-table))

(define (variable? exp) (symbol? exp))

(define (self-evaluating? exp) 
  (cond ((number? exp) true) 
        ((string? exp) true)
        (else false)))

(define (true? x) (not (eq? x false))) 
(define (false? x) (eq? x false))

(define (if-predicate exp) (cadr exp)) 
(define (if-consequent exp) (caddr exp)) 
(define (if-alternative exp)
    (if (not (null? (cdddr exp))) 
      (cadddr exp)
      'false))

(define (eval-if exp env)
(if (true? (eval (if-predicate exp) env))
      (eval (if-consequent exp) env)
      (eval (if-alternative exp) env)))



(define (eval exp env)
    (cond ((self-evaluating? exp) exp)
          ((variable? exp) (lookup-variable-value exp env))
          ((and (pair? exp) ((table 'lookup-proc) (list (car exp)))) 
            (((table 'lookup-proc) (list (car exp))) exp env))
          ((application? exp) 
            (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
           (else (error "Unknown expression type: EVAL" exp))))


(define (make-lambda parameters body) 
  (cons 'lambda (cons parameters body)))

(define (make-procedure parameters body env) 
  (list 'procedure parameters body env))

(define (last-exp? seq) (null? (cdr seq))) 
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))

(define (sequence->exp seq) 
  (cond ((null? seq) seq)
              ((last-exp? seq) (first-exp seq))
(else (make-begin seq))))
(define (make-begin seq) (cons 'begin seq))


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

(define (install-definition-package)


(define (definition-variable exp)
  (if (symbol? (cadr exp)) 
    (cadr exp)
    (caadr exp)))

(define (definition-value exp)
(if (symbol? (cadr exp)) (caddr exp)
      (make-lambda (cdadr exp)
                   (cddr exp))))

(define (eval-definition exp env) 
(define-variable! (definition-variable exp)
                    (eval (definition-value exp) env)
                    env)
'ok)

((table 'insert-proc!) 
    (list 'define) 
    eval-definition)
    
    'done)

(define (install-if-package)

((table 'insert-proc!) 
    (list 'if) 
    eval-if)
    
    'done)

(define (install-lambda-package)

(define (lambda-parameters exp) (cadr exp))
 (define (lambda-body exp) (cddr exp))


((table 'insert-proc!) 
    (list 'lambda) 
    (lambda (exp env) 
    (make-procedure 
      (lambda-parameters exp)
      (lambda-body exp)
      env)))
    
    'done)

(define (install-begin-package)

(define (begin-actions exp) (cdr exp))


(define (eval-sequence exps env) 
  (cond ((last-exp? exps)
         (eval (first-exp exps) env))
         (else
          (eval (first-exp exps) env) 
          (eval-sequence (rest-exps exps) env))))


((table 'insert-proc!) 
    (list 'begin) 
    (lambda (exp env) (eval-sequence (begin-actions exp) env)))
    
    'done)

(define (install-cond-package)

(define (make-if predicate consequent alternative)
        (list 'if predicate consequent alternative))

(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause)
(eq? (cond-predicate clause) 'else))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause) (cdr clause))

(define (cond->if exp) (expand-clauses (cond-clauses exp))) 
(define (expand-clauses clauses)
(if (null? clauses)
'false
(let ((first (car clauses)) (rest (cdr clauses)))
(if (cond-else-clause? first) (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last: COND->IF"
                       clauses))
            (make-if (cond-predicate first)
                     (sequence->exp (cond-actions first))
                     (expand-clauses rest))))))

((table 'insert-proc!) 
    (list 'cond) 
    (lambda (exp env)(eval (cond->if exp) env)))
    
    'done)


(install-quote-package)
(install-assignment-package)
(install-definition-package)
(install-if-package)
(install-lambda-package)
(install-begin-package)
(install-cond-package)