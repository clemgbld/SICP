(define (procedure-parameters exp)
    (map (lambda (p) 
        (if (pair? p) 
            (car p) 
                p)) 
        (cadr exp)))


(define (delay-it exp param env)
    (cond ((eq? 'lazy-memo (cadr param) ) (list 'thunk-memo exp env))
        ((eq? 'lazy (cadr param)) (list 'thunk exp env))
        (else (error "wrong syntax to lazy evaluate param" param))))
