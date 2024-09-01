(load "ch-5/ch5-eceval-support.scm")

(define (get-value-address address) (cdr address))

(define (get-scope-address address) (car address))

(define (find-frame n env ) 
  (if (= n 0) (first-frame env)
   (find-frame (- n 1) (enclosing-environment env ))))

(define (lexical-address-lookup address env) 
  (let ((value (list-ref 
    (frame-values (find-frame (get-scope-address address) env) ) 
    (get-value-address address)))) 
      (if (eq? value '*unassigned*) 
        (error value " SHOULD NOT BE UNASSIGNED" ) 
        value)))
