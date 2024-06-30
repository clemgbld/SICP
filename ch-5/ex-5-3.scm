(define (sqrt x)
(define (good-enough? guess)
(< (abs (- (square guess) x)) 0.001)) 
(define (improve guess)
(average guess (/ x guess))) 
(define (sqrt-iter guess)
(if (good-enough? guess) guess
              (sqrt-iter (improve guess))))
        (sqrt-iter 1.0))

;simplified version with good-enough and improve as primitives

(controller 
    (assign guess (const 1.0))
    good-enough-loop
    (assign x (op (read)))
    test-guess
    (test (op good-enough) (reg guess) (reg x))
    (branch (label done))
    (assign guess (op improve) (reg guess))
    (goto (label test-guess))
    done
    (perform (op print) (reg guess))
    (goto (label good-enough-loop)))

; version with good-enough and imporve not primitives

(controller 
    (assign guess (const 1.0))
    good-enough-loop
    (assign x (op (read)))
    test-guess
    ;improve
    (assign s (op square ) (reg guess))
    (assign s (op -) (reg s) (reg x))
    (assign s (op abs) (reg s))
    (test (op <) (reg s) (const 0.001))
    (branch (label done))
    ;good-enough?
    (assign t (op /) (reg x) (reg guess))
    (assign guess (op average) (reg guess) (reg t) )
    (goto (label test-guess))
    done
    (perform (op print) (reg guess))
    (goto (label good-enough-loop))
    )


; version with average and abs not primitive 

(controller 
    (assign guess (const 1.0))
    good-enough-loop
    (assign x (op (read)))
    test-guess
    ;improve
    (assign s (op square ) (reg guess))
    (assign s (op -) (reg s) (reg x))
    ;abs
    (test (op >) (reg s) (const -1))
    (branch (label positive-number))
    (assign s (op -) s)
    positive-number
    (test (op <) (reg s) (const 0.001))
    (branch (label done))
    ;good-enough?
    (assign t (op /) (reg x) (reg guess))
    ;average
    (assign sum (op +) (reg t) (reg guess))
    (assign avg (op /) (reg sum) (const 2))
    (assign guess (reg avg))
    (goto (label test-guess))
    done
    (perform (op print) (reg guess))
    (goto (label good-enough-loop))
    )