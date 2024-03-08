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
    
        (define (recur key tree)
            (let ((new-node (make-tree (cons key value) '() '())))
                (cond ((equal? key (car (entry tree)))
                    (set-cdr! (entry tree) value)
                    tree) 
                ((key<? key (car (entry tree)))
                (cond ((null? (left-branch tree))
                    (set-left-branch! tree new-node)
                    (left-branch tree))
                   (else (recur key (left-branch tree)))))
                (else (cond ((null? (right-branch tree))
                    (set-right-branch! tree new-node)
                    (right-branch tree)) 
                   (else (recur key (right-branch tree))))))))
      
      (define (build-initial-trees keys)
        (if (null? (cdr keys)) 
            (make-tree (cons (car keys ) value) '() '())
            (make-tree (cons (car keys) (build-initial-trees (cdr keys))) '() '())))

        (if (null? root-node) 
            (set! root-node (build-initial-trees keys))
            (recur (car keys) root-node)) 
        'ok)

    (define (dispatch m)
        (cond ((eq? m 'lookup-proc) lookup)
              ((eq? m 'insert-proc!) insert!)
              (else (error "Unknown operation: TABLE" m))))

        dispatch))