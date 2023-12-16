(define (p x) (- (* 3 x) (* 4 (cube x)))) 

(define (sine angle)
(if (not (> (abs angle) 0.1)) angle
(p (sine (/ angle 3.0)))))

(sine 12.15)
;p is called 5 times

;2) What is the orders of growth of the steps ? O(log(n))

;3) What is the orders of growth of the space ? O(log(n))