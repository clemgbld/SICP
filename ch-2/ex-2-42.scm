
(load "functions/functions.scm")

(define (queens board-size) 
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board) 
                (filter (lambda (positions) 
                    (safe? k positions)) 
                        (flatmap (lambda (rest-of-queens) 
                            (map (lambda (new-row)
                                (adjoin-position new-row k rest-of-queens))
                                    (enumerate-interval 1 board-size)))
                                        (queen-cols (- k 1))))))
                                            (queen-cols board-size))

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens) 
    (append rest-of-queens (list (queen new-row k))))


(define (safe? k positions) 
    (let ((positions-witout-kth-queen 
        (remove-kth-queen k positions))
            (kth-queen (list-ref positions (dec k))))
                (check? kth-queen positions-witout-kth-queen)))

(define (remove-kth-queen k positions) 
    (remove (lambda (pos) (= k (column pos))) positions))

(define (check? kth-queen positions)
    (cond ((null? positions) #t)
        ((is-queen-attacked kth-queen positions) #f)
            (else (check? kth-queen (cdr positions)))))

(define (is-queen-attacked kth-queen positions)
    (let ((another-queen (car positions)))
        (or (same-row? kth-queen another-queen)
            (same-diagonal-right? kth-queen another-queen)
            (same-diagonal-left? kth-queen another-queen))))

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
