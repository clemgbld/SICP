(load "functions/functions.scm")

(define (multiply a b) (cond ((= b 0) 0)
      ((even? b) (multiply (double a) (/ b 2)))
      (else (+ a (multiply a (- b 1))))))

