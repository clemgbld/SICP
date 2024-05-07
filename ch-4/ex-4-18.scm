
;alternative scan out 

(lambda (f y0 dt) 
    (let ((y '*unassigned*) (dy '*unassigned*))
        (let ((a (integral (delay dy) y0 dt)) 
            (b (stream-map f y))) 
            (set! y a)
            (set! dy b))
        y))

;orginal scan out

(lambda (f y0 dt)
    (let ((y '*unassigned*)
         (dy '*unassigned*)) 
         (set! y (integral (delay dy) y0 dt))
         (set! dy (stream-map f y)) 
    y))


; it will work with the original scan out because 
; it will delay dy which is unassigned when y is set
; and i will set dy which will set the delayed dy to in y so
; everything will be fine

; The second won't work because y is unassinged at the time of
; (b (stream-map f y))

    