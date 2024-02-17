(define (make-account initial-amount password) 

    (define count 0)

    (define (call-the-cops) "Cops called")

    (define (deposit amount) 
        (set! count 0)
        (set! initial-amount (+ initial-amount amount))
            initial-amount)

    (define (withdraw amount) 
    (set! count 0)
    (if ( > amount  initial-amount) "Insufficient funds"
    (begin (set! initial-amount (- initial-amount amount)) initial-amount)))

    (define (reject-operation amount) 
        (if (> count 7) 
            (call-the-cops) 
            (begin (set! count (+ 1 count)) "Incorrect password"))) 

(lambda (entered-password m) 
    (cond
        ((not (eq? entered-password password)) reject-operation) 
        ((eq? m 'deposit) deposit)
        ((eq? m 'withdraw) withdraw)
        (else(error "Unknown request: MAKE-ACCOUNT" m)))))