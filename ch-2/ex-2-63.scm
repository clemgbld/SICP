(define (tree->list-1 tree) 
    (if (null? tree)
        '()
            (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree)))))) 

;(tree->list-1 (list 7 (list 3 (list 1 '() '()) (list 5 '() '() )) 
;(9 (list 7 '() '()) (list 11 '() '()))))

;    (append (tree->list-1 ((list 3 (list 1 '() '()) (list 5 '() '() )))
;              (cons 7 
;                    (tree->list-1 ((9 (list 7 '() '()) (list 11 '() '()))))))                    

;    (append  (append (tree->list-1 (list 1 '() '()))
;                 (cons 3 
;                    (tree->list-1 (list 5 '() '())))) 
;              (cons 7 
;                    (append '() 
;                        (cons 9 (tree->list-1 (11 '() '()))))))                    

;    (append  (append '()
;       (cons 1 '()))
;                 (cons 3 
;                    (append '() (cons 5 '())))) 
;              (cons 7 
;                    (append '() 
;                        (cons 9 (append '() (cons 11 '()))))))

;    (append  (append '()
;       (cons 1 '()))
;                 (cons 3 
;                    (cons 5 '()))) 
;              (cons 7 
;                    (append '() 
;                        (cons 9 (cons 11 '())))))

;    (append  
;       (cons 1 
;                 (cons 3 
;                    (cons 5 '())) 
;              (cons 7(cons 9 (cons 11 '()))))
; list 1
;(list 1 3 5 7 9 11)

;list 2 
; (list 1 3 5 7 9 11)

;list 3
;(list 1 3 5 7 9 11)




(define (tree->list-2 tree)
    (define (copy-to-list tree result-list) 
        (if (null? tree)
            result-list
                (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                              (right-branch tree)
                              result-list)))))
(copy-to-list tree '()))

; (copy-to-list (list (3 (list 1 '() '()) (list 5 '() '()))) 
;     (cons 7 (copy-to-list (list 9 '() '(11 '() '())) '())))

; (copy-to-list (list (3 (list 1 '() '()) (list 5 '() '()))) 
;     (cons 7 (copty-to-list '() 
;         (cons 9 (copy-to-list (list 11 '() '()) '())))))

; (copy-to-list (list (3 (list 1 '() '()) (list 5 '() '()))) 
;     (cons 7 (copty-to-list '() 
;         (cons 9 (copy-to-list '()
;             (cons 11 (copy-to-list '() '())))))))

; (copy-to-list (list (3 (list 1 '() '()) (list 5 '() '()))) 
;     (cons 7 (copty-to-list '() 
;         (cons 9 (copy-to-list '()
;             (cons 11 ()))))))

; (copy-to-list (list (3 (list 1 '() '()) (list 5 '() '()))) 
;     (cons 7 (copty-to-list '() 
;         (cons 9 (cons 11 '())))))

; (copy-to-list (list (3 (list 1 '() '()) (list 5 '() '()))) 
;     (cons 7 (cons 9 (cons 11 '()))))

; (copy-to-list (list 1 '() '()) 
;     (cons 3 (copy-to-list (list 5 '() '()) 
;         (cons 7 (cons 9 (cons 11 '()))))))

; (copy-to-list (list 1 '() '()) 
;     (cons 3 (copy-to-list '() 
;         (cons 5 (copy-to-list '() 
;             (cons 7 (cons 9 (cons 11 '()))))))))

; (copy-to-list (list 1 '() '()) 
;     (cons 3 (copy-to-list '() 
;         (cons 5 (cons 7 (cons 9 (cons 11 '())))))))

; (copy-to-list (list 1 '() '()) 
;     (cons 3 (cons 5 (cons 7 (cons 9 (cons 11 '()))))))

;list 1
; (list 1 3 5 7 9 11)

;list 2 
; (list 1 3 5 7 9 11)

;list 3
;(list 1 3 5 7 9 11)

; as you can see the trees evaluate to the same list with each procedure

; the second procedure seems to grow more slowly because the append procedure used by the first procedure is O(n)