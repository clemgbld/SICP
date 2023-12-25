(load "ch-2/ex-2-7.scm")

(define (make-calc-bound sign) 
    (lambda (center percent) 
        (sign center (* center (/ percent 100.0)))))

(define calc-lower-bound (make-calc-bound - ))

(define calc-upper-bound (make-calc-bound + ))

(define (make-center-percent center percent) 
    (make-interval (calc-lower-bound center percent) (calc-upper-bound center percent)))

(define (center i) 
    (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i) 
    (* (/ (- (upper-bound i) (center i)) (center i)) 100.0))