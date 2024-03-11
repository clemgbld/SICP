(define (inverter input output) 
    (define (invert-input)
        (let ((new-value (logical-not (get-signal input))))
            (after-delay inverter-delay
            (lambda () (set-signal! output new-value)))))
            (add-action! input invert-input) 'ok) 
            
(define (logical-not s)
    (cond ((= s 0) 1) 
        ((= s 1) 0)
        (else (error "Invalid signal" s))))

(define (and-gate a1 a2 output) 
    (define (and-action-procedure)
        (let ((new-value
        (logical-and (get-signal a1) (get-signal a2))))
        (after-delay and-gate-delay
            (lambda () (set-signal! output new-value)))))
        (add-action! a1 and-action-procedure)
        (add-action! a2 and-action-procedure)
    'ok)

(define (logical-and s1 s2)
    (if (and (= s1 1) (= s2 1))
        1
        0))

; De Morgan's laws

(define (or-gate a1 a2 output)
    (let ((o1 (make-wire)) 
         (o2 (make-wire)) 
         (o3 (make-wire)))
        (inverter a1 o1)
        (inverter a2 o2)
        (and-gate o1 o2 o3)
        (inverter o3 output))
        'ok)

; (2 * inverter delay) + and gate dalay