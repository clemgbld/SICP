(load "ch-2/ex-2-9.scm")

 (define (div-interval x y) 
   (if (= (upper-bound y) (lower-bound y)) 
     (error "division by zero interval") 
     (mul-interval x  
       (make-interval (/ 1.0 (upper-bound y)) 
                       (/ 1.0 (lower-bound y)))))) 

(sub-interval (make-interval 1 2) (make-interval 0 0))
