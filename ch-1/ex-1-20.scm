(define (gcd a b) (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

; normal order (lazy evaluation)
;(gcd 40 (remainder 206 40))
;1
;(gcd (remainder 206 40) remainder(40,(remainder 206 40)))
;3
;(gcd remainder(40,(remainder 206 40)) remainder((remainder 206 40) remainder(40,(remainder 206 40))))
;7
;(gcd remainder((remainder 206 40) remainder(40,(remainder 206 40))) remainder(remainder(40,(remainder 206 40)) remainder( (remainder 206 40) remainder(40,(remainder 206 40)))))
;14
;(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
    ;(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    ;(gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder a  (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
;18
;(if (= 0 0)
    ;(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    ;(gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) (remainder a  (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

;number of remainder call 18



;applicative order 
;(gcd 40 (remainder 206 40))
;(gcd 40 6)
;(gcd 6 (remainder 40 6))
;(gcd 6 4)
;(gcd 4 remainder(6 4))
;(gcd 4 2)
;(gcd 2 remainder(4 2))
;(gcd 2 0)
;0
;number of remainder call 4