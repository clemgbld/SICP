(define (make-frame variables values)
    (map cons variables values))

(define (first-frame env) (car env))
(define (enclosing-environment env) (cdr env))
(define the-empty-environment '())

(define (extend-environment vars vals base-env) 
(if (= (length vars) (length vals))
    (cons (make-frame vars vals) base-env) 
    (if (< (length vars) (length vals))
          (error "Too many arguments supplied" vars vals)
          (error "Too few arguments supplied" vars vals))))

(define (lookup-variable-value var env) 
    (define (env-loop env)
    (if (eq? env the-empty-environment)
     (error "Unbound variable" var)
          (scan 
            (lambda () (env-loop (enclosing-environment env)))
            (lambda (frame) (cdar frame))
            var
            (first-frame env))))
  (env-loop env))

(define (set-variable-value! var val env) 
    (define (env-loop env)
    (if (eq? env the-empty-environment) 
    (error "Unbound variable: SET!" var) 
        (scan 
        (lambda () (env-loop (enclosing-environment env)))
        (lambda (frame) (set-cdr! (car frame) val)) 
        var
        (first-frame env))))
  (env-loop env))

(define (define-variable! var val env)
    (scan 
        (lambda () (set-car! env (list (cons var val))))
        (lambda (frame) (set-cdr! (car frame) val))
        var
        (first-frame env)))

    (define (scan when-null when-equal var frame)
        (cond ((null? frame) (when-null)) 
            ((eq? var (caar frame)) (when-equal frame))
            (else (scan when-null when-equal var (cdr frame)))))