(load "ch-3/ex-3-74.scm")

(define (make-zero-crossings input-stream last-value last-asvp) 
    (let ((avpt (/ (+ (stream-car input-stream)
                    last-value)
                 2.0)))
    (cons-stream
     (sign-change-detector avpt last-asvp)
     (make-zero-crossings
      (stream-cdr input-stream) (stream-car input-stream) avpt))))
