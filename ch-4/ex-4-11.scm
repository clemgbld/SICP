(define (make-frame variables values)
    (map cons variables values))

(define (first-frame env) (car env))
(define (enclosing-environment env) (cdr env))
(define the-empty-environment '())


(define (add-binding-to-frame! var val frame)
    (let ((first-var (caar frame)) (first-val (cdar frame)))
        (set-car! frame (cons var val) )
        (set-cdr! frame (cons (cons first-var first-val) (cdr frame)))))

(define (extend-environment vars vals base-env) 
(if (= (length vars) (length vals))
    (cons (make-frame vars vals) base-env) 
    (if (< (length vars) (length vals))
          (error "Too many arguments supplied" vars vals)
          (error "Too few arguments supplied" vars vals))))

(define (lookup-variable-value var env) 
    (define (env-loop env)
    (define (scan frame) 
        (cond ((null? frame)
        (env-loop (enclosing-environment env))) 
        ((eq? var (caar frame)) (cdar frame))
        (else (scan (cdr frame)))))
    (if (eq? env the-empty-environment)
     (error "Unbound variable" var) (let ((frame (first-frame env)))
          (scan frame))))
  (env-loop env))

(define (set-variable-value! var val env) 
    (define (env-loop env)
    (define (scan frame) 
    (cond ((null? frame)
(env-loop (enclosing-environment env))) 
    ((eq? var (caar frame)) (set-cdr! (car frame) val)) 
    (else (scan (cdr frame)))))
(if (eq? env the-empty-environment) 
    (error "Unbound variable: SET!" var) 
    (let ((frame (first-frame env)))
          (scan frame))))
  (env-loop env))

(define (define-variable! var val env)
 (let ((frame (first-frame env)))
    (define (scan frame)
    (cond ((null? frame) 
        (set-car! env (list (cons var val))))
    ((eq? var (caar frame)) (set-cdr! (car frame) val)) 
    (else (scan (cdr frame)))))
    (scan frame)))




