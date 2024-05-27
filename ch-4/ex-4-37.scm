(define (a-pythagorean-triple-between low high) 
    (let ((i (an-integer-between low high))
        (hsq (* high high)))
            (let ((j (an-integer-between i high)))
            (let ((ksq (+ (* i i) (* j j)))) 
            (require (>= hsq ksq))
            (let ((k (sqrt ksq)))
            (require (integer? k))
            (list i j k))))))

;Yes Ben Bitdelle procedure is more performant on large range because it generate less k number than the exercise 4.35

;But on small range the procedure of exercise 4.35 will be faster because sqrt procedure is O(n)