(define (reverse-fold-left seq) 
    (fold-left (lambda (x y)  (cons y x)) '() seq))

(define (reverse-fold-right seq) 
    (fold-right (lambda (x y) (append y (list x))) '() seq))


