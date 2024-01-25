(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree)) 

(define (right-branch tree) (caddr tree)) 

(define (make-tree entry left right)
   (list entry left right))

(define (record key value) 
    (cons key value))

(define (key record) 
    (car record))

(define (lookup given-key set-of-records) 
    (if (null? set-of-records) #f 
        (let ((head (entry set-of-records)))
            (let ((head-key (key head)))
                  (cond ((equal? given-key head-key) head)
                        ((< given-key head-key ) 
                            (lookup given-key 
                                (left-branch set-of-records)))
                        (else (lookup given-key 
                            (right-branch set-of-records))))))))