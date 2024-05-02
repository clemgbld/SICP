(define (make-frame variables values) 
    (cons variables values))

(define (first-frame env) (car env))
(define (frame-variables frame) (car frame))
(define (frame-values frame)(cdr frame))

(define (make-unbound! var env)
    (define (scan vars vals)
        (cond ((null? (cdr vars)) (error "Unbound variable!" var)) 
            ((eq? var (cadr vars)) 
                (set-cdr! vars (cddr vars))
                (set-cdr! vals (cddr vals)))
            (else (scan (cdr vars) (cdr vals)))))
    (let* ((frame (first-frame env)) 
           (vars (frame-variables frame))
           (vals (frame-values frame)))
        (cond ((null? vars) (error "Unbound variable!" var)) 
            ((and (eq? var (car vars))
                     (null? (cdr vars))) (set-car! env '()))
            ((eq? var (car vars)) 
                (set-car! env (cons (cdr vars) (cdr vals))))
            (else (scan 
                vars 
                vals)))))
        
; I prefer to unbound variable only on the first scope level to stay coherent with the fact
; than we can only define a variable on one scope level