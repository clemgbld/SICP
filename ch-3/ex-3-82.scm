(define (in-circle x y) 
   (>= 1 (+ (square x) 
            (square y)))) 

(define (estimate-integral P x1 x2 y1 y2)
    (define x1-stream (cons-stream x1 x1-stream))
    (define x2-stream (cons-stream x2 x2-stream))
    (define y1-stream (cons-stream y1 y1-stream))
    (define y2-stream (cons-stream y2 y2-stream))
    (stream-map 
        (lambda (p) (* (area x1 x2 y2 y1) p))
        (monte-carlo 
            (stream-map 
                P 
                (stream-map random-in-range x1-stream x2-stream) 
                (stream-map random-in-range y1-stream y2-stream)) 
            0 
            0)))

(define (area x1 x2 y2 y1)
    (* (- x2 x1) (- y2 y1)))

(define (monte-carlo experiment-stream passed failed) 
(define (next passed failed)
    (cons-stream
     (/ passed (+ passed failed))
     (monte-carlo
(stream-cdr experiment-stream) passed failed))) (if (stream-car experiment-stream)
      (next (+ passed 1) failed)
(next passed (+ failed 1))))

(define (random-in-range low high) 
    (let ((range (- high low)))
        (+ low (random range))))

 (define estimate-pi 
   (estimate-integral in-circle -1.0 1.0 -1.0 1.0)) 