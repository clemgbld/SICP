(define (split fn another-fn)
    (define (recur painter n) 
        (if (= n 0) 
            painter 
                (let ((smaller (recur (- n 1))))
                    (fn painter (another-fn smaller smaller)))))
                        recur)