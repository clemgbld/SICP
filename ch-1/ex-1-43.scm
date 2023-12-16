(load "functions/functions.scm")

(define (repeated f n)
  (cond ((< n 1) identity)
    ((= n 1) f)
      (else (compose f (repeated f (- n 1))))))