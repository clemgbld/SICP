(define (no-operands? exps)
    (null? exps))

(define (first-operand exps)
    (list-ref exps (- (length exps) 1)))

(define (rest-operands exps)
    (take exps (- (length exps) 1)))

(define (list-of-values exps env)
    (if (no-operands? exps) 
        '()
        (cons (first-operand exps) 
        (list-of-values (rest-operands exps) env))))