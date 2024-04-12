(load "ch-3/ex-3-77.scm")

(define (RCL R L C dt)
    (lambda (vC0 iL0)
        (define vC (integral (delay (scale-stream iL (/ -1 C))) vC0 dt))
        (define iL (integral (delay diL) iL0 dt))
        (define diL (add-streams 
                    (scale-stream vC (/ 1 L))
                    (scale-stream iL (/ (* -1 R) L))))
        (stream-map cons vC iL)))

(define rcl (RCL 1 0.2 1 0.1))
(stream->list (stream-take (rcl 10 0) 100))