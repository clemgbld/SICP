; because we need to add a clause to the require in addition of an-integer-starting in order to enable the amb evaluator to backtrack to a previous branche

(define (a-pythagorean-triple-between integer) 
    (let ((i (an-integer-starting-from integer)))
        (let ((j (an-integer-between integer i)))
            (let ((k (an-integer-between integer j))) 
                (require (= (+ (* i i) (* j j)) (* k k))) 
                    (list i j k)))))

(define (an-integer-starting-from n)
(amb n (an-integer-starting-from (+ n 1))))

(define (an-integer-between low high)
        (require (<= num low high))
        (amb low (an-integer-between (+ low 1) high)))