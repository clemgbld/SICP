(define (make-table )
    (let ((local-table (list '*table*)))

(define (assoc key records)
        (cond ((null? records) false)
            ((equal? key (caar records)) (car records)) 
            (else (assoc key (cdr records)))))

        (define (lookup keys) 
            (let ((subtable
                (assoc (car keys) (cdr local-table))))
                (if subtable
                     (let ((record
                         (assoc (cadr keys) (cdr subtable))))
                          (if record (cdr record) false))
                             false)))

    (define (insert! keys value) 
        (let ((subtable
         (assoc (car keys) (cdr local-table))))
            (if subtable
                (let ((record
                    (assoc (cadr keys) (cdr subtable))))
                        (if record
                            (set-cdr! record value) 
                            (set-cdr! subtable
                            (cons (cons (cadr keys) value)
                                  (cdr subtable)))))
                (set-cdr! local-table
                      (cons (list (car keys) (cons (cadr keys) value))
                            (cdr local-table)))))
                            'ok)
    (define (dispatch m)
        (cond ((eq? m 'lookup-proc) lookup)
              ((eq? m 'insert-proc!) insert!)
              (else (error "Unknown operation: TABLE" m))))

        dispatch))
    

