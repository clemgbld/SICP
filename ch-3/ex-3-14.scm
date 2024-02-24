(define (mystery x) 
(define (loop x y)
    (if (null? x) y
        (let ((temp (cdr x))) 
            (set-cdr! x y)
             (loop temp x))))
            (loop x '()))


(define v (list 'a 'b 'c 'd))

(define w (mystery v))
; v (a)
; w (d c b a)

;mystery is in fact a reverse it holds the cdr of the x in a temp variable and set the cdr of the the x variable to the y variable and the call the loop with the temp variable which will take the place of the x in the next iteration and put x as a second argument which will take the place of y in the next iteration the loops go on until the x is empty and return y which is the reversed list 



