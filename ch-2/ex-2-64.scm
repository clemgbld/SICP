(define (list->tree elements)
    (car (partial-tree elements (length elements))))

(define (partial-tree elts n) 
    (if (= n 0)
        (cons '() elts)
        (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result
        (partial-tree elts left-size)))
        (let ((left-tree (car left-result)) 
        (non-left-elts (cdr left-result)) 
        (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts)) 
                    (right-result
                   (partial-tree
                    (cdr non-left-elts)
                    right-size)))
                     (let ((right-tree (car right-result)) 
                        (remaining-elts (cdr right-result)))
                      (cons (make-tree this-entry
                                    left-tree
                                       right-tree)
                            remaining-elts))))))))

; (partial-tree (list 1 3 5 7 9 11) 6)
;     (let ((left-size 2))
;         (let ((left-result 
;             (partial-tree (list 11 3 5 7 9 11) 2)))
;             (let ((left-tree (car left-result)) 
;         (non-left-elts (cdr left-result)) 
;         (right-size 3))
;             (let ((this-entry (car non-left-elts)) 
;                     (right-result
;                    (partial-tree
;                     (cdr non-left-elts)
;                     right-size)))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))

; (partial-tree (list 1 3 5 7 9 11) 6)
;     (let ((left-size 2))
;         (let ((left-result 
;             (partial-tree (list 1 3 5 7 9 11) 2)
;     (let ((left-size 1))
;         (let ((left-result 
;             (partial-tree (list 11 3 5 7 9 11) left-size)))
;             (let ((left-tree (car left-result)) 
;         (non-left-elts (cdr left-result)) 
;         (right-size 0))
;             (let ((this-entry (car non-left-elts)) 
;                     (right-result
;                    (partial-tree
;                     (cdr non-left-elts)
;                     right-size)))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))))
;             (let ((left-tree (car left-result)) 
;         (non-left-elts (cdr left-result)) 
;         (right-size 3))
;             (let ((this-entry (car non-left-elts)) 
;                     (right-result
;                    (partial-tree
;                     (cdr non-left-elts)
;                     right-size)))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))

; (partial-tree (list 1 3 5 7 9 11) 6)
;     (let ((left-size 2))
;         (let ((left-result 
;     (let ((left-size 1))
;         (let ((left-result 
;             (let ((left-size 0))
;         (let ((left-result
;         (cons '() (list 1 3 5 7 9 11))))
;         (let ((left-tree '()) 
;         (non-left-elts (list 1 3 5 7 9 11)) 
;         (right-size 0))
;             (let ((this-entry 1) 
;                     (right-result
;                    (cons '() (list 3 5 7 9 11))))
;                      (let ((right-tree '()) 
;                         (remaining-elts (list 3 5 7 9 11)))
;                       (cons (list  1 '() '())
;                             (list 3 5 7 9 11)))))))))
;             (let ((left-tree (car left-result)) 
;         (non-left-elts (cdr left-result)) 
;         (right-size 0))
;             (let ((this-entry (car non-left-elts)) 
;                     (right-result
;                    (partial-tree
;                     (cdr non-left-elts)
;                     right-size 0)))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))))
;             (let ((left-tree (car left-result)) 
;         (non-left-elts (cdr left-result)) 
;         (right-size 3))
;             (let ((this-entry (car non-left-elts)) 
;                     (right-result
;                    (partial-tree
;                     (cdr non-left-elts)
;                     right-size)))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))

; (partial-tree (list 1 3 5 7 9 11) 6)
;     (let ((left-size 2))
;         (let ((left-result 
;     (let ((left-size 1))
;         (let ((left-result (cons (list 1 '() '()) 
;             (list 3 5 7 9 11))))
;             (let ((left-tree (list 1 '() '())) 
;         (non-left-elts (list 3 5 7 9 11)) 
;         (right-size 0))
;             (let ((this-entry 3) 
;                     (right-result
;                    (cons '() (list  5 7 9 11))))
;                      (let ((right-tree '()) 
;                         (remaining-elts (list 5 7 9 11)))
;                       (cons (list 3 (list 1 '() '()) '())
;                             (list 5 7 9 11)))))))))
;             (let ((left-tree (car left-result)) 
;         (non-left-elts (cdr left-result)) 
;         (right-size 3))
;             (let ((this-entry (car non-left-elts)) 
;                     (right-result
;                    (partial-tree
;                     (cdr non-left-elts)
;                     right-size)))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))

;     (let ((left-size 2))
;         (let ((left-result 
;     (cons (list 3 (list 1 '() '()) '())
;                             (list 5 7 9 11))))
;             (let ((left-tree (list 3 (list 1 '() '()))) 
;         (non-left-elts (list 5 7 9 11)) 
;         (right-size 3))
;             (let ((this-entry 5) 
;                     (right-result
;                    (partial-tree (list  7 9 11) 3)))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))

; (let ((left-size 2))
;         (let ((left-result 
;     (cons (list 3 (list 1 '() '()) '())
;                             (list 5 7 9 11))))
;             (let ((left-tree (list 3 (list 1 '() '()))) 
;         (non-left-elts (list 5 7 9 11)) 
;         (right-size 3))
;             (let ((this-entry 5) 
;                     (right-result
;                    (let ((left-size 1))
;         (let ((left-result 
;     (partial-tree (7 9 11) 1)))
;             (let ((left-tree (car left-result)) 
;         (non-left-elts (cdr left-result)) 
;         (right-size ))
;             (let ((this-entry (car non-left-elts)) 
;                     (right-result
;                    (partial-tree (cdr non-left-elts) )))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))

; (let ((left-size 2))
;         (let ((left-result 
;     (cons (list 3 (list 1 '() '()) '())
;                             (list 5 7 9 11))))
;             (let ((left-tree (list 3 (list 1 '() '()))) 
;         (non-left-elts (list 5 7 9 11)) 
;         (right-size 3))
;             (let ((this-entry 5) 
;                     (right-result
;                    (let ((left-size 1))
;         (let ((left-result 
;             (let ((left-size 0))
;         (let ((left-result
;         (cons '() (list 7 9 11))))
;         (let ((left-tree '()) 
;         (non-left-elts (list 7 9 11)) 
;         (right-size 0))
;             (let ((this-entry 7) 
;                     (right-result
;                    (cons '() (list 9 11))))
;                      (let ((right-tree '()) 
;                         (remaining-elts (list 9 11)))
;                       (cons (list 7 
;                                    '() 
;                                        '())
;                             (list 9 11)))))))))
;             (let ((left-tree (car left-result)) 
;         (non-left-elts (cdr left-result)) 
;         (right-size 0))
;             (let ((this-entry (car non-left-elts)) 
;                     (right-result
;                    (partial-tree (cdr non-left-elts) 1)))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))

; (let ((left-size 2))
;         (let ((left-result 
;     (cons (list 3 (list 1 '() '()) '())
;                             (list 5 7 9 11))))
;             (let ((left-tree (list 3 (list 1 '() '()))) 
;         (non-left-elts (list 5 7 9 11)) 
;         (right-size 3))
;             (let ((this-entry 5) 
;                     (right-result
;                    (let ((left-size 1))
;         (let ((left-result 
;             (cons (list 7 '() '()) (list 9 11))))
;             (let ((left-tree (list 7 '() '())) 
;         (non-left-elts (list 9 11)) 
;         (right-size 0))
;             (let ((this-entry 9) 
;                     (right-result
;                    (cons '() (list 11))))
;                      (let ((right-tree '()) 
;                         (remaining-elts (list 11)))
;                       (cons (list 9 (list 7 '() '()) '())
;                             (list 11)))))))))
;                      (let ((right-tree (car right-result)) 
;                         (remaining-elts (cdr right-result)))
;                       (cons (make-tree this-entry
;                                     left-tree
;                                        right-tree)
;                             remaining-elts))))))

; (let ((left-size 2))
;         (let ((left-result 
;     (cons (list 3 (list 1 '() '()) '())
;                             (list 5 7 9 11))))
;             (let ((left-tree (list 3 (list 1 '() '()))) 
;         (non-left-elts (list 5 7 9 11)) 
;         (right-size 3))
;             (let ((this-entry 5) 
;                     (right-result
;                    (cons (list 9 (list 7 '() '()) '())
;                             (list 11))))
;                      (let ((right-tree 
;                      (list 9 (list 7 '() '()) '())) 
;                         (remaining-elts (list 11)))
;                       (cons (list 5 
;                                    (list 3 (list 1 '() '())) 
;                                        (list 9 (list 7 '() '())))
;                             (list 11)))))))

;(list 5 
;   (list 3 (list 1 '() '())) 
;             (list 9 (list 7 '() '()) (list 11 '() '())))

; this procedure is building tree from a list and keeping the remaing element based on n on a list
; it's starts to recursivly produce the left branch of the balanced tree with the first element on the list 
; then it hit the first node and then produce the right branch of the balanced tree

; complexity O(n)
