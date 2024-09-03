




(define (find-variable target cenv) 
    (define (iter cenv count) 
      (cond ((null? cenv) 'not-found)
        (else (let ((var-address (find-var-address (car cenv) target 0)) ) 
              (if (number? var-address) 
                (cons count var-address) 
               (iter (cdr cenv) (+ count 1)))))))
     (iter cenv 0))

(define (find-var-address vars target count) 
    (cond ((null? vars) 'not-found)
          ((eq? target (car vars)) count)
          (else (find-var-address (cdr vars) target (+ count 1)) )
          ))

    
