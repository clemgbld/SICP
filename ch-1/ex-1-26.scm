(define (expmod base exp m) (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
m)) 
(else(remainder(* base (expmod base (- exp 1) m))
          m))))

;(expmod 10 4 3)
;(remainder (square (expmod 10 2 3) 3))
;(remainder (square (remainder (square (expmod 10 1 3))))3)
;(remainder (square (remainder (square (remainder (* 10 (expmod 10 0 3))3))3)3))
;(remainder (square (remainder (square (remainder (square 16) 3))3)3))
;(remainder (square (remainder (square (1)3))3)
;(remainder (square (1))3)
;1


(define (louis-expmod base exp m) (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (louis-expmod base (/ exp 2) m)
                       (louis-expmod base (/ exp 2) m))
                    m))
(else
(remainder (* base
                       (louis-expmod base (- exp 1) m))
                    m))))

;(louis-expmod 10 4 3)
;(remainder (* (louis-expmod 10 2 3) (louis-expmod 10 2 3))3)
;(remainder (* (remainder (* (louis-expmod 10 1 3) (louis-expmod 10 1 3)) 3) (remainder (* (louis-expmod 10 1 3) (louis-expmod 10 1 3)) 3))3)
;(remainder (* (remainder (* ( * 10 1) (* 10 1)) 3) (remainder (* (10 1 ) (* 10 1)) 3))3)
;(remainder (* 1 1)3)
;(remainder 1 3)
;1


(define (linear-expmod base exp m) 
(remainder (* base (linear-expmod base (- exp 1) m)) m))

;(linear-expmod 10 4 3)
;(remainder (* 10 (linear-expmod 10 3 3))3)
;(remainder (* 10 (remainder (* 10 (linear-expmod 10 2 3))3))3)
;(remainder (* 10 (remainder (* 10 (remainder (* 10 (linear-expmod 10 1 3)) 3))3))3)
;(remainder (* 10 (remainder (* 10 (remainder (* 10 (remainder (* 10 (linear-expmod 10 0 3))3)) 3))3))3)
;(remainder (* 10 (remainder (* 10 (remainder (* 10 (remainder 10 3)) 3))3))3)
;(remainder (* 10 (remainder (* 10 (remainder (* 10 (remainder 10 3)) 3))3))3)
;1

;louis-expmod do unessary calculation by calculating (linear-expmod base exp m) twice and then multiply both result together at each even steps that is why it's a O(n) growth.

;the original expmod just calculate (expmod base exp m) once and then squate it at each even steps that is why the growth is O(log n) growth.
