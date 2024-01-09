(define (rev l)
  (define (recur new-list old-list)
    (if (null? old-list) 
       new-list 
            (recur (append (list (car old-list)) new-list )  (cdr old-list))))
                            (recur '() l))