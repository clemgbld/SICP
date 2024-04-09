(load "ch-3/ex-3-74.scm")

(define  (smooth input-stream)
    (stream-map (lambda (curr last)(/ (+ curr last) 2)) 
                input-stream 
                (cons-stream 0 input-stream)))

(define zero-crossings-smoothed 
(stream-map 
    sign-change-detector 
    sense-data
    (smooth sense-data)))