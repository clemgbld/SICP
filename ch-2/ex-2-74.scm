(define (attach-tag type-tag content) 
    (cons type-tag content))

(define (get-record employee-id file)
 (attach-tag (division file) 
    ((get 'get-record (divison file)) employee-id file)))

(define (get-salary record) 
    (let ((record-type (car record)) 
          (record-content (cdr record)))
          ((get 'get-salary record-type) record-content)))

(define (find-employee-record employee-id file-list)
    (if (null? file-list) #f 
        (let ((current-file (car file-list)))
            (if (get-record employee-id current-file) 
            (get-record employee-id current-file)
            (find-employee-record employee-id (cdr file-list))))))

;d) the new company will needs to install a new package