(define (make-account initial-amount password) 
    (define (deposit amount) 
        (set! initial-amount (+ initial-amount amount))
            initial-amount)

    (define (withdraw amount) 
    (if ( > amount  initial-amount) "Insufficient funds"
    (begin (set! initial-amount (- initial-amount amount)) initial-amount)))

    (define (reject-operation amount) "Incorrect password") 

(lambda (entered-password m) 
    (cond
        ((eq? m 'is-same-password?) (eq? entered-password password))
        ((not (eq? entered-password password)) reject-operation) 
        ((eq? m 'deposit) deposit)
        ((eq? m 'withdraw) withdraw)
        (else(error "Unknown request: MAKE-ACCOUNT" m)))))