(car ''abracadabra)
;(car (quote quote abracadabra))

;it's because ' is syntactic sugar for (quote ) who create a list of expression.
;so (car ''abracadabra) give the first element of the list of quote who is another quote.
; (cadr ''abracadabra) give abracadabra 