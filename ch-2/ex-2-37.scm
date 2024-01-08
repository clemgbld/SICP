(load "functions/functions.scm")
(load "ch-2/ex-2-36.scm")

(define (dot-product v w)
      (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v) 
    (map (lambda (v-from-matrix) 
        (dot-product v-from-matrix v ))  m))

(define (transpose mat) 
    (accumulate-n cons '() mat))

(define (matrix-*-matrix m n) 
    (let ((cols (transpose n)))
        (map (lambda (v) (matrix-*-vector cols v)) m)))