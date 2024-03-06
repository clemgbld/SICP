(define (make-table key<?)
    (let ((root-node '()))

    (define (make-tree entry left right)
        (list entry left right))

    (define (entry tree)
        (car tree))

    (define (right-branch tree) (caddr tree))

    (define (set-right-branch! tree value)
        (set-cdr! (cdr tree) (cons value '())))


        (define (lookup keys) 

            (define (recur keys tree) 
                (if (null? tree) 
                    #f
                    (if (equal? (car keys) (car (entry tree)))
                        (cdr (entry tree))
                        (recur keys (right-branch tree)))))

            (recur keys root-node))

    (define (insert! keys value) 
        (define (recur keys tree)
            (cond ((key<? (car keys) (car (entry tree)))
                'not-implemented)
                (else (set-right-branch! tree (make-tree (cons (car keys) value) '() '())))))

        (if (null? root-node) 
            (set! root-node (make-tree (cons (car keys ) value) '() '()))
            (recur keys root-node)) 
        'ok)

    (define (dispatch m)
        (cond ((eq? m 'lookup-proc) lookup)
              ((eq? m 'insert-proc!) insert!)
              (else (error "Unknown operation: TABLE" m))))

        dispatch))