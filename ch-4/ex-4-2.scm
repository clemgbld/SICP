;a Louis Reasoner idea does not work because it we try (define x 3)
; it will go in this case (application ? exp) and try to do this action
;(apply (eval 'define ) (list-of-values '(x 3))) withc will recursively call eval with 'define
; and will result in the error ( "Unknown expression type -- EVAL" exp) 

;b in order to solve Louis's problem we need to change the procedures of the application procedure


(define (application? exp) 
    (and (pair? exp) 
         (and (not (null? (cdr exp))) 
         (symbol? (cadr exp))) 
         (eq? (car exp) 'call)) )

;(define (operator exp) (car exp))
;(define (operands exp) (cdr exp))

