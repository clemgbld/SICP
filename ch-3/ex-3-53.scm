
(define s (cons-stream 1 (add-streams s s)))

;1,2,4,8,16,32,64 and so on...
;the stream start at 1 and then for each element of the new stream produce
;take the car of the stream s and add it with itself
;thus a sream of powers of 2 like the double stream example in the book


