(define (adjoin-set x set)
    (cond ((< x (car set)) (cons x set))
          ((= x (car set)) set)
          (else (cons (car set) (adjoin-set x (cdr set))))))