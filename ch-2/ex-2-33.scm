
(define (accumulate op initial sequence) 
    (if (null? sequence)
        initial
            (op (car sequence)
                (accumulate op initial (cdr sequence)))))

(define (custom-map p sequence) 
    (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (custom-append first-sequence second-sequence) 
    (accumulate cons second-sequence first-sequence))

(define (custom-length sequence) 
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence))