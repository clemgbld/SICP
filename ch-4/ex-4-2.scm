;a Louis Reasoner idea does not work because it we try (define x 3)
; it will go in this case (application ? exp) and try to do this action
;(apply (eval 'define ) (list-of-values '(x 3))) withc will recursively call eval with 'define
; and will result in the error ( "Unknown expression type -- EVAL" exp) 

;b in order to solve Louis's problem we need to change the procedures of the application procedure

(define (tagged-list? exp tag) (if (pair? exp)
            (eq? (car exp) tag)
            false))

(define (application? exp) 
    (and (tagged-list? exp 'call) 
         (and (not (null? (cdr exp))) 
         (symbol? (cadr exp)))) )

(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))

