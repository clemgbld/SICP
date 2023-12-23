(define (cons-int a b)
  (* (expt 2 a) (expt 3 b)))

 (define (divides? a b) 
   (= 0 (remainder b a))) 
  
 (define (count-0-remainder-divisions n divisor) 
   (define (iter x divisions) 
     (if (divides? divisor x) 
         (iter (/ x divisor) (+ divisions 1)) 
         divisions)) 
   (iter n 0)) 


 (define (car-int z) (count-0-remainder-divisions z 2)) 
 (define (cdr-int z) (count-0-remainder-divisions z 3)) 