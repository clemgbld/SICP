(load "functions/functions.scm")

(define (count-leaves tree) 
    (accumulate + 0 
        (map (lambda (x) 
            (if (not (pair? x)) 1 
                (count-leaves x))) tree)))