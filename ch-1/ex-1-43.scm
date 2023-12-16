(load "functions/functions.scm")

(define (repeated f n)
  (cond ((< n 1) identity)
    ((= n 1) f)
      ((even? n) (repeated (compose f f) (/ n 2))) 
        (else (compose f (repeated f (- n 1))))))