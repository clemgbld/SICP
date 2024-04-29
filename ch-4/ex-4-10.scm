;let's say we want to put the name of the procedure at the end and not in the beggining

;we need to change tag list to find the if the last expression is the expected tag

(define (last-exp? seq) (null? (cdr seq))) 
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))

 (define (tagged-list? exp tag) (if (pair? exp)
            (if (last-exp? exp) 
                (eq? (first-exp exp) tag)
                (tagged-list? (rest-exps exp) tag)) 
             false))

; and change the related procedure that extract information from the expression
; if we do that we don't need to touch to neither eval nor apply
; a small example with if: 

 (define (if? exp) (tagged-list? exp 'if)) 
  
 (define (if-predicate exp) (car exp)) 
  
 (define (if-consequent exp) (cadr exp)) 
  
 (define (if-alternative exp) 
     (if (= (length exp) 4) 
         (caddr exp) 
         'false)) 
  
 ; ... 

