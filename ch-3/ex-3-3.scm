(define (make-account initial-amount password) 
    (define (deposit amount) 
        (set! initial-amount (+ initial-amount amount))
            initial-amount)

    (define (withdraw amount) 
    (if ( > amount  initial-amount) "Insufficient funds"
    (begin (set! initial-amount (- initial-amount amount)) initial-amount)))

    (define (check-password entered-password proc) 
        (lambda (amount) 
        (if (eq? entered-password password) 
            (proc amount) 
            "Incorrect password")))

(lambda (entered-password m) 
    (cond 
        ((eq? m 'deposit) (check-password entered-password deposit))
        ((eq? m 'withdraw) (check-password entered-password withdraw))
        (else(error "Unknown request: MAKE-ACCOUNT" m)))))