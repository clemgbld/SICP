(define (cons-int x y) 
    (lambda (num) (if (= num 0) (expt 2 x)
        (expt 3 y))))

(define (car-int dispatch) 
    (dispatch 0))

(define (cdr-int dispatch) 
    (dispatch 1))