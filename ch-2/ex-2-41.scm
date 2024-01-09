(load "functions/functions.scm")
(load "ch-2/ex-2-40.scm")

(define (triples-that-match-sum n s) 
    (filter (sum-to? s) 
        (flatmap  
            (lambda (l) 
                (map (lambda (x) (append (list x) l)) 
                    (enumerate-interval (+ 1 (car l)) n))) 
                        (unique-pairs n))))
                    
(define (sum-to? s) 
    (lambda (seq) (= s (fold-left + 0 seq))))


                           
    