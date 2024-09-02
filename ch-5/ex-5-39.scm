(load "ch-5/ch5-eceval-support.scm")

(define (make-lexical-address frame-address value-address )
 (cons frame-address value-address))

(define (get-value-address address) (cdr address))

(define (get-scope-address address) (car address))

(define (find-frame n env ) 
  (cond 
    ((null? env) (error "Unbound variable"))
    ((= n 0) (first-frame env))
    (else (find-frame (- n 1) (enclosing-environment env )))))

(define (lexical-address-lookup address env) 
  (let ((value (list-ref 
    (frame-values (find-frame (get-scope-address address) env) ) 
    (get-value-address address)))) 
      (if (eq? value '*unassigned*) 
        (error value " SHOULD NOT BE UNASSIGNED" ) 
        value)))

(define (lexical-address-set! address env val)
  (let* ((value-tail (frame-values 
             (list-tail (find-frame (get-scope-address address) env) 
                        (get-value-address address)))) 
         (value (car value-tail)))
     (if (eq? value  '*unassigned*) 
       (error value " SHOULD NOT BE UNASSIGNED --SET" ) 
       (set-car! value-tail val))))
