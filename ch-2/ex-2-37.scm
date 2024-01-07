(load "functions/functions.scm")

(define (dot-product v w)
      (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v) 
    (map (lambda (v-from-matrix) 
        (dot-product v-from-matrix v ))  m))