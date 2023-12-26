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

(define (add . nums) 
    (lambda (f) 
        (lambda (x) ((pipe (map (lambda (num) (num f)) nums)) x))))

;(add-1 (lambda (f)  (lambda (x) x))))
;(lambda (f)  (lambda (x) (f ((lambda (x) x) x)))))
;(lambda (f)  (lambda (x) (f x)))))
