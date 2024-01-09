(define (deep-reverse l)
  (define (recur new-list old-list)
    (if (null? old-list) 
       new-list 
            (recur (append (let ((item (car old-list)))
                (if (pair? item) (list (deep-reverse item)) 
                    (list item))) new-list )  (cdr old-list))))
                            (recur '() l))