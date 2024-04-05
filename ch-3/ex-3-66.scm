(load "functions/streams.scm")

(define integer-pairs (pairs integers integers))

;the sream interleave pairs and double it every time the a left part of a pair is increased for each left part

; f(n,m) m>=n (m,n is Z+) - 1
; (m-n=0):(2^n - 1) - 1 
; (m-n=1):((2^n - 1) + 2^(n - 1)) - 1 
; (m-n>1):((2^n - 1) + 2^(n - 1) + (m - n - 1) * 2^n) - 1 