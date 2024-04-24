(define (cond-clauses exp) (cdr exp))

(define (cond-else-clause? clause)

(eq? (cond-predicate clause) 'else))

(define (cond-predicate clause) (car clause))

(define (cond-actions clause) (cdr clause))

(define (last-exp? seq) (null? (cdr seq)))
 (define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))


(define (recipient? clause) (eq? (cadr clause) '=>))

(define (recipient clause) (caddr clause))

(define (make-lambda parameters body) 
  (cons 'lambda (cons parameters body)))


(define (make-if predicate consequent alternative)
        (list 'if predicate consequent alternative))

(define (cond->if exp) (expand-clauses (cond-clauses exp)))

(define (sequence->exp seq) 
    (cond ((null? seq) seq)
              ((last-exp? seq) (first-exp seq))
(else (make-begin seq))))

(define (make-begin seq) (cons 'begin seq))

 (define make-application 
   (lambda (operator operands) 
     (cons operator operands))) 
  
 (define make-let 
   (lambda (var val body) 
     (make-application (make-lambda (list var) body) val))) 

(define (expand-clauses clauses)
        (if (null? clauses)
        'false
                (let ((first (car clauses)) (rest (cdr clauses)))
                        (if (cond-else-clause? first)
                         (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last: COND->IF"
                       clauses))
            (if (recipient? first)
                    (make-let 'result 
                        (cond-predicate first) 
                        (make-if 'result 
                                 (make-application (recipient first) 
                                                   (list 'result)) 
                                 (expand-clauses rest))) 
             (make-if (cond-predicate first)
                     (sequence->exp (cond-actions first))
                     (expand-clauses rest)))))))
