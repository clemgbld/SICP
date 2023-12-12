;linear recursive solution
;(define (count-frac n d k) 
;(define (recur i) 
;(if (= k i) (/ (n i) (d i) ) 
;(/ (n i) (+ (d i) (recur (+ 1 i))))))
;(recur 1))

;(/ (n 1) (+ (d 1) (recur 2)))
;(/ (n 1) (+ (d 1) (/ (n 2) ( + (d 2) (recur 3)))))
;(/ (n 1) (+ (d 1) (/ (n 2) ( + (d 2) (/ (n 3) (n 3))))))

;iterative solution
(define (count-frac n d k) 
(define (iter i result) 
(if (= i 0) result
(iter (- i 1) (/ (n i) (+ result (d i))))))
(iter (- k 1) (/ (n k) (d k))))

(count-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           4)