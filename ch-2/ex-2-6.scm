(load "functions/functions.scm")

(define zero (lambda (f) 
    (lambda (x) x))) 

(define one (lambda (f) 
    (lambda (x) (f x))))

(define two (lambda (f) 
    (lambda (x) (f (f x)))))
    
(define (add-1 n)
    (lambda (f) 
        (lambda (x) (f ((n f) x)))))

(define (add a b) 
    (lambda (f) 
        (lambda (x) ((a f) ((b f) x)))))

;(add-1 (lambda (f)  (lambda (x) x))))
;(lambda (f)  (lambda (x) (f ((lambda (x) x) x)))))
;(lambda (f)  (lambda (x) (f x)))))