(define (in-circle x y) 
   (>= 1 (+ (square x) 
            (square y)))) 


(define (estimate-integral P x1 x2 y1 y2 trials)
    (* (area x1 x2 y2 y1) 
        (monte-carlo trials 
            (lambda () 
                (P (random-in-range x1 x2) 
                   (random-in-range y1 y2))))))

(define (area x1 x2 y2 y1)
    (* (- x2 x1) (- y2 y1)))


(define (monte-carlo trials experiment)
    (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
    (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
(+ trials-passed 1))) 
(else
(iter (- trials-remaining 1)
                 trials-passed))))
  (iter trials 0))

(define (random-in-range low high) 
    (let ((range (- high low)))
        (+ low (random range))))

 (define (estimate-pi) 
   (estimate-integral in-circle -1.0 1.0 -1.0 1.0 10000)) 

(estimate-pi)