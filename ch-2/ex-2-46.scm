(define (make-vect x y) 
    (cons x y))

(define (x-coordinate v)
    (car v))

(define (y-coordinate v)
    (cdr v))

(define (op-vect op)
    (lambda (a-vect another-vect) 
    (make-vect (op (x-coordinate a-vect) ( x-coordinate another-vect)) 
        (op (y-coordinate a-vect) (y-coordinate another-vect)))))

(define add-vect (op-vect + ))

(define sub-vect (op-vect - ))

(define (scale-vect s v) 
    (make-vect (* s (x-coordinate v)) (* s (y-coordinate v))))