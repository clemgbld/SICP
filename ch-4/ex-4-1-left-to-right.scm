(define (no-operands? exps)
    (null? exps))

(define (first-operand exps)
    (car exps))

(define (rest-operands exps)
    (cdr exps))

(define (list-of-values exps env)
    (if (no-operands? exps) 
        '()
        (cons (eval (first-operand exps) env)
         (list-of-values (rest-operands exps) env))))