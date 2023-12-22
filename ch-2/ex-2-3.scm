(load "ch-2/ex-2-2.scm")

(define (make-rect bottom-left top-right) 
    (cons bottom-left top-right))

(define (select-top-right rect) (cdr rect))

(define (select-bottom-left rect) (car rect))

(define (select-width rect) 
    ( - (coord-x (select-top-right rect)) (coord-x (select-bottom-left rect))))

(define (select-height rect) 
    ( - (coord-y (select-top-right rect)) (coord-y (select-bottom-left rect))))

(define (area rect) 
    (* (select-width rect) (select-height rect)))

(define (perimeter rect) 
    (* 2 (+ (select-width rect) (select-height rect))))

(define (make-rect-bis center top-right) 
    (cons center top-right))

(define (select-top-right-bis rect) (cdr rect))

(define (select-center rect) (car rect))

(define (select-top-right rect) (cdr rect))

(define (select-bottom-left rect) (car rect))

(define (perimeter-bis rect) 
    (* 2 (+ (select-width-bis rect) (select-height-bis rect))))

(define (select-height-bis rect) 
    ( * 2 (- (coord-x (select-top-right rect)) ( coord-x (select-center rect)))))

(define (select-height-bis rect) 
    ( * 2 (- (coord-y (select-top-right rect)) ( coord-y (select-center rect)))))

(define (area-bis rect) 
    (* (select-width rect) (select-height rect)))