(load "functions/functions.scm")

(define (queens k)
    (let (positions (build-queens k))
        (for-each (lambda (queen) (
            (for-each 
                (lambda (another-queen) 
                    (require (not (is-queen-attacked? 
                                    queen 
                                    another-queen)))) 
                (remove 
                    (lambda (another-queen)
                        (equal? queen another-queen)) 
                    positions))
        )) positions)
            positions))

(define (list->amb l)
    (if (null? l) 
        '()
        (amb (car l) (cdr l))))

(define (build-queens k)
   (define (recur i)
    (if (> i k)
        '()
        (cons (list->amb 
            (map (lambda (j) (queen j i)) 
            (enumerate-interval 1 k))) 
            (recur (+ i 1)))))
        (recur 1))

(define (is-queen-attacked? queen another-queen)
        (or (same-row? queen another-queen)
            (same-diagonal-right? queen another-queen)
            (same-diagonal-left? queen another-queen)))

(define (same-diagonal-right? a-queen another-queen)
    (queen-equal? (lowest-diagonal-right-queen a-queen) 
                (lowest-diagonal-right-queen another-queen)))

(define (same-diagonal-left? a-queen another-queen)
    (queen-equal? (lowest-diagonal-left-queen a-queen) 
        (lowest-diagonal-left-queen another-queen)))

(define (lowest-diagonal-right-queen a-queen)
    (queen (- (row a-queen) (- (column a-queen) 1)) 1))

(define (lowest-diagonal-left-queen a-queen)
    (queen (+ (row a-queen) (- (column a-queen) 1)) 1))

(define (same-row? queen another-queen)
    (= (row queen) (row another-queen)))

(define (queen row column) 
    (cons row column))

(define (queen-equal? queen another-queen)
    (equal? queen another-queen))

(define (row queen) 
    (car queen))

(define (column queen)
    (cdr queen))