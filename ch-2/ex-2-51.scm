(load "ch-2/ex-2-50.scm")

(define (beside painter1 painter2)
(let ((split-point (make-vect 0.5 0.0)))
(let ((paint-left (transform-painter
            painter1
            (make-vect 0.0 0.0)
            split-point
            (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter
            painter2
            split-point
            (make-vect 1.0 0.0)
            (make-vect 0.5 1.0))))
(lambda (frame) (paint-left frame) (paint-right frame)))))

(define (below painter1 painter2)
(let ((split-point (make-vect 0.0 0.5)))
(let ((paint-left (transform-painter
            painter1
            (make-vect 0.0 0.0)
            (make-vect  1.0 0.0)
            split-point))
          (paint-right
           (transform-painter
            painter2
            split-point
            (make-vect 1.0 0.5)
            (make-vect 0.0 1.0))))
(lambda (frame) (paint-left frame) (paint-right frame)))))

(define (below-bis painter1 painter2)
    (rotate270 (beside (rotate90 painter1) (rotate90 painter2))))

 (define (below3 p1 p2) 
   (rotate180 (rotate270 (beside (rotate270 p1) (rotate270 p2))))) 