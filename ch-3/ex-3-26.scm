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
            (define (recur keys tree) 
                (if (null? tree) 
                    #f
                    (let ((key (car keys)) 
                        (head-key (car (entry tree))))
                        (cond ((equal? key head-key)
                        (cdr (entry tree)))
                       ((key<? key head-key)
                            (recur keys (left-branch tree))) 
                        (else (recur keys (right-branch tree)))))))

            (recur keys root-node))

    (define (insert! keys value) 
    
        (define (recur keys tree)
            (let ((new-node (make-tree (cons (car keys) value) '() '())))
                (cond ((key<? (car keys) (car (entry tree)))
                (set-left-branch! tree new-node))
                (else (if (null? (right-branch tree)) 
                    (set-right-branch! tree new-node)
                        (recur keys (right-branch tree)))))))

        (if (null? root-node) 
            (set! root-node (make-tree (cons (car keys ) value) '() '()))
            (recur keys root-node)) 
        'ok)

    (define (dispatch m)
        (cond ((eq? m 'lookup-proc) lookup)
              ((eq? m 'insert-proc!) insert!)
              (else (error "Unknown operation: TABLE" m))))

        dispatch))