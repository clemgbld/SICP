(define (make-table key<?)
    (let ((root-node '()))

    (define (make-tree entry left right)
        (list entry left right))

    (define (entry tree)
        (car tree))

    (define (right-branch tree) (caddr tree))

    (define (left-branch tree) (cadr tree))

    (define (set-left-branch! tree value)
        (set-car! (cdr tree) value))

    (define (set-right-branch! tree value)
        (set-cdr! (cdr tree) (cons value '())))

        (define (lookup keys) 
            (define (recur key tree) 
                (if (or (null? tree) (not (list? tree))) 
                    #f
                    (let ((head-key (car (entry tree))))
                        (cond ((equal? key head-key)
                        (cdr (entry tree)))
                       ((key<? key head-key)
                            (recur key (left-branch tree))) 
                        (else (recur key (right-branch tree)))))))

                    (define (iter keys tree)
                        (let ((sub-tree (recur (car keys) tree)))
                         (if (null? (cdr keys)) sub-tree 
                                (if sub-tree
                                    (iter (cdr keys) sub-tree)
                                    #f))))

            (iter keys root-node))

    (define (insert! keys value) 

 (define (build-initial-trees keys)
        (if (null? (cdr keys)) 
            (make-tree (cons (car keys ) value) '() '())
            (make-tree (cons (car keys) (build-initial-trees (cdr keys))) '() '())))
    
        (define (recur keys tree)
            (let ((new-node (make-tree (cons (car keys) value) '() '())))
                (cond ((equal? (car keys) (car (entry tree)))
                    (cond ((null? (cdr keys))
                            (set-cdr! (entry tree) value)) 
                        ((not (pair? (cdr (entry tree)))) 
                        (set-cdr! (entry tree) (build-initial-trees (cdr keys))))
                        (else (recur (cdr keys) (cdr (entry tree)))))) 
                ((key<? (car keys) (car (entry tree)))
                (cond ((null? (left-branch tree))
                    (if (null? (cdr keys))
                        (set-left-branch! tree new-node)
                        (set-left-branch! tree (build-initial-trees keys))))
                   (else (recur keys (left-branch tree)))))
                (else (cond ((null? (right-branch tree))
                    (if (null? (cdr keys)) 
                        (set-right-branch! tree new-node)
                        (set-right-branch! tree (build-initial-trees keys)))) 
                   (else (recur keys (right-branch tree))))))))

        (if (null? root-node) 
            (set! root-node (build-initial-trees keys))
            (recur  keys root-node)) 
        'ok)

    (define (dispatch m)
        (cond ((eq? m 'lookup-proc) lookup)
              ((eq? m 'insert-proc!) insert!)
              (else (error "Unknown operation: TABLE" m))))

        dispatch))