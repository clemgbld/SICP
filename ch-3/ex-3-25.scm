(define (make-table )
    (let ((local-table (list '*table*)))

(define (assoc key records)
        (cond ((null? records) false)
            ((equal? key (caar records)) (car records)) 
            (else (assoc key (cdr records)))))

        (define (lookup keys) 
            (define (recur keys table)
                (if (null? (cdr keys)) 
                    (let ((record (assoc (car keys) (cdr table))))
                        (if record (cdr record) false))
                    (let ((subtable (assoc (car keys) (cdr table))))
                        (if subtable
                            (recur (cdr keys) subtable)
                            false))))
            (recur keys  local-table))

    (define (build-key-list keys value)
        (define (recur keys)
            (if (null? (cdr keys)) 
                (cons (car keys) value)
                (list (car keys) (recur (cdr keys)))))
        (recur keys))

    (define (insert! keys value) 
        (define (recur keys table)
            (if (null? (cdr keys))
                (let ((record (assoc (car keys) (cdr table))))
                    (if record 
                        (set-cdr! record value)
                        (set-cdr! table (cons (cons (car keys) value) (cdr table)))))
                (let ((subtable (assoc (car keys) (cdr table))))
                    (if subtable 
                        (recur (cdr keys) subtable)
                        (set-cdr! table (cons (build-key-list keys value) (cdr table)))))))
        (recur keys local-table)
                            'ok)
    (define (dispatch m)
        (cond ((eq? m 'lookup-proc) lookup)
              ((eq? m 'insert-proc!) insert!)
              (else (error "Unknown operation: TABLE" m))))

        dispatch))
    

