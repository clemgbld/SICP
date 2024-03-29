(define (make-semaphore n)
    (let ((cells (build-falsy-list-of-length-n n)))
        (define (try-to-acquire num-of-try c)
            (if (= num-of-try n) 
                (try-to-acquire 0 cells)
                (if (test-and-set! c)
                    (try-to-acquire (+ num-of-try 1) (cdr c))
                    'acquired)))
        (define (the-semaphore m)
            (cond ((eq? m 'acquire) (try-to-acquire 0 cells))
                ((eq? m 'release) (clear! cells)))))
        the-semaphore)

(define (build-falsy-list-of-length-n n)
    (if (= n 0) 
        '()
        (cons #f (build-falsy-list-of-length-n (- n 1)))))

(define (clear! cells)
    (cond ((null? cells) 'nothing-to-clear)
        ((car cells) (set-car! cells false))
        (else (clear! (cdr cells)))))

(define (test-and-set! cell) 
    (without-interrupts
        (lambda ()
            (if (car cell)
                true
                (begin (set-car! cell true)
                false)))))