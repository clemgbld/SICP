(define (definition-value exp)
(if (symbol? (cadr exp)) (caddr exp)
      (make-lambda (cdadr exp)
                   (cddr exp))))


(define (make-lambda parameters body) 
    (cons 'lambda (cons parameters body)))