(define (pascal c r) 
(cond ((> c r) #f) 
((or (= c 1) (= c r)) 1)
(else 2)))