(define x (list 1 2 3))

(define y (list 4 5 6))

(append x y)

;(1 ( 2 ( 3 (4 (5 (6 nil))))))

(cons x y)

;((1 (2 (3 nil))) . (4 (5 (6 nil))))

(list x y)

;((1 (2 (3 nil))) ((4 (5 (6 nil))) nil))