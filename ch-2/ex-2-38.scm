(fold-right / 1 (list 1 2 3)) ;1.5 or (3/2)

(fold-left / 1 (list 1 2 3)) ; 0.16666667 or (1/6)

(fold-left list '() (list 1 2 3)) ; ((list (list (list '() 1) 2) 3))

(fold-right list '() (list 1 2 3)) ;(list 1 (list 2 (list 3 '())))


; the op should be commutative (that means that the order of the list should not affect the end result)