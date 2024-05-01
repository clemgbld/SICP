(define (make-frame variables values)
    (if (null? variables) 
        '()
        (cons 
            (cons (car variables) (car values)) 
            (make-frame (cdr variables) (cdr values)))))



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
    (define (scan frame)
        (cond ((eq? (caar frame) var) (cdar frame))
        (else (scan (cdr frame)))))
    (let ((frame (first-frame env)))
        (scan frame)))
