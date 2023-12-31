(define (same-parity first . nums) (append (list first)  
    (filter 
        (if (even? first ) even? 
            odd?) 
                nums)))