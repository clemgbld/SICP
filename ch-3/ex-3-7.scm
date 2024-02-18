(load "ch-3/ex-3-3.scm")

(define (make-joint acc acc-password joint-password) 
    (if (not (acc acc-password 'is-same-password?)) 
        (error "Wrong password!")
        (lambda (entered-password m) 
            (cond
                ((eq? m 'is-same-password?) (equal? entered-password joint-password))
                ((not (eq? entered-password joint-password)) (lambda (m) "Incorrect password")) 
                ((eq? m 'deposit) (acc acc-password m))
                ((eq? m 'withdraw) (acc acc-password m))
                (else (error "Unknown request make-joint:" m))))))

