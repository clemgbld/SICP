(load "functions/streams.scm")

(define sum 0)

(define (accum x) 
    (set! sum (+ x sum)) 
    sum) 

(define seq
  (stream-map accum
              (stream-enumerate-interval 1 20)))

(define y (stream-filter even? seq)) 

(define z
(stream-filter (lambda (x) (= (remainder x 5) 0)) seq))

(stream-ref y 7)
;136

(display-stream z)
;10,15,45,55,105,120,190,210

;sum = 210

; without the optimization provided by memo-proc the result would have been
;different for the sum because thanks to the memoization it call accum only once with the same number
;without the memo-proc the sum would have been 246 
;and the the computation of the 8 first item of the stream would have happen a second time when calling display-stream 