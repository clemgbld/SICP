(define (expmod base exp m) (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
m)) 
(else(remainder(* base (expmod base (- exp 1) m))
          m))))

(define (fast-expt b n) 
(cond ((= n 0) 1)
((even? n) (square (fast-expt b (/ n 2))))
 (else (* b (fast-expt b (- n 1))))))

(define (modified-expmod base exp m) 
(remainder (fast-expt base exp) m))

 (define (report-elapsed-time start-time) 
   (display " *** ") 
   (display (- (runtime) start-time))) 

 ; Test the speed 
 (define start-time (runtime)) 
 (expmod 999999 1000000 1000000) 
 (report-elapsed-time start-time) 
  
 ;(define start-time (runtime)) 
 ;(modified-expmod 999999 1000000 1000000) 
 ;(report-elapsed-time start-time) 

 ;the modified exp mod algorithm take a lot more time because it does the remainder only at the end
 ;with a potential huge number because of the squaring
