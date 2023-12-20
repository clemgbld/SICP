(define (rat-to-string x) 
    (string-append (number->string (numer x)) "/" (number->string (denom x))))


(define (check-rat x y message)
    (check ( string=? (rat-to-string x) (rat-to-string y)) message))