(load "functions/streams.scm")

(define (pairs s t) 
    (interleave
        (stream-map (lambda (x) (list (stream-car s) x)) t)
        (pairs (stream-cdr s) (stream-cdr t))))

;this procedure won't work and will loop forever because we try
;to do a stream-cdr of pairs with stream cdr of the two input stream without any delay 
