(define (square-list items) (define (iter things answer)
(if (null? things) answer
        (iter (cdr things)
              (cons (square (car things))
answer))))
(iter items nil))

;(1 2 3) (cons 9 (cons 4 (cons 1 nil))) it's in reverse order because the first pair is actually the last and go into the previous pair at each iteration until it reach the end and return the answer

(define (square-list items)
(define (iter things answer) (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

; (1 2 3) (cons (cons (cons nil 1) 4) 9) it's still does not work because the list is not built properly the first element of the first pair should be a number and not a nested pair and the last element should be a nil (the tail of the linked list) and not a number