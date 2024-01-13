(load "ch-2/ex-2.43.scm")

(define (queens board-size) 
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board) 
                (filter (lambda (positions) 
                    (safe? k positions)) 
                        (flatmap (lambda (new-row) 
                            (map (lambda (rest-of-queens)
                                (adjoin-position new-row k rest-of-queens))
                                    (queen-cols (- k 1))))
                                        (enumerate-interval 1 board-size)))))
                                            (queen-cols board-size))


;Switching the (enumerate-interval 1 board-size) with the recursive (queen-cols board-size) will produce unecessary positions generations.
;Because the queen-cols procedure will be reavaluated for each item produced by the enumerate-interval.
;so assuming the last puzzle was solve in time T it is now (board-size ^ board-size)T.