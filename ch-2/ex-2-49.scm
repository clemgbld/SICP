(load "ch-2/ex-2-46.scm")
(load "ch-2/ex-2-48.scm")

(define (frame-coord-map frame) (lambda (v)
    (add-vect
     (origin frame)
          (add-vect (scale-vect (x-coordinate v) (edge1 frame))
               (scale-vect (y-coordinate v) (edge2 frame))))))

(define (segments->painter segment-list) (lambda (frame)
(for-each
(lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))

(define v1 (make-vec 0 0))

(define v2 (make-vect 1 0))

(define v3 (make-vect 1 1))

(define v4 (make-vect 0 1))

(define outline (segments->painter 
    (list 
        (make-segment v1 v2)
        (make-segment v2 v3)
        (make-segment v3 v4)
        (make-segment v4 v1))))

(define cross (segments->painter
    (list
        (make-segment v1 v3)
        (make-segment v2 v4))))

 (define diamond 
   (segments->painter 
    (list 
        (make-segment (vect 0.0 0.5) (vect 0.5 1.0)) 
        (make-segment (vect 0.5 1.0) (vect 1.0 0.5)) 
        (make-segment (vect 1.0 0.5) (vect 0.5 0.0)) 
        (make-segment (vect 0.5 0.0) (vect 0.0 0.5))))) 

 (define wave 
   (segments->painter (list 
                       (make-segment (make-vect 0.25 0) (make-vect 0.35 0.5)) 
                       (make-segment (make-vect 0.35 0.5) (make-vect 0.3 0.6)) 
                       (make-segment (make-vect 0.3 0.6) (make-vect 0.15 0.4)) 
                       (make-segment (make-vect 0.15 0.4) (make-vect 0 0.65)) 
                       (make-segment (make-vect 0 0.65) (make-vect 0 0.85)) 
                       (make-segment (make-vect 0 0.85) (make-vect 0.15 0.6)) 
                       (make-segment (make-vect 0.15 0.6) (make-vect 0.3 0.65)) 
                       (make-segment (make-vect 0.3 0.65) (make-vect 0.4 0.65)) 
                       (make-segment (make-vect 0.4 0.65) (make-vect 0.35 0.85)) 
                       (make-segment (make-vect 0.35 0.85) (make-vect 0.4 1)) 
                       (make-segment (make-vect 0.4 1) (make-vect 0.6 1)) 
                       (make-segment (make-vect 0.6 1) (make-vect 0.65 0.85)) 
                       (make-segment (make-vect 0.65 0.85) (make-vect 0.6 0.65)) 
                       (make-segment (make-vect 0.6 0.65) (make-vect 0.75 0.65)) 
                       (make-segment (make-vect 0.75 0.65) (make-vect 1 0.35)) 
                       (make-segment (make-vect 1 0.35) (make-vect 1 0.15)) 
                       (make-segment (make-vect 1 0.15) (make-vect 0.6 0.45)) 
                       (make-segment (make-vect 0.6 0.45) (make-vect 0.75 0)) 
                       (make-segment (make-vect 0.75 0) (make-vect 0.6 0)) 
                       (make-segment (make-vect 0.6 0) (make-vect 0.5 0.3)) 
                       (make-segment (make-vect 0.5 0.3) (make-vect 0.4 0)) 
                       (make-segment (make-vect 0.4 0) (make-vect 0.25 0)) 
                       ))) 
