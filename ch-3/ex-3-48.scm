(define (make-account-and-serializer balance id) 
    (define (withdraw amount)
        (if (>= balance amount)
            (begin (set! balance (- balance amount))
               balance)
            "Insufficient funds"))
    (define (deposit amount)
        (set! balance (+ balance amount)) balance)
    (let ((balance-serializer (make-serializer))) 
        (define (dispatch m)
            (cond ((eq? m 'withdraw) withdraw)
                ((eq? m 'deposit) deposit)
                ((eq? m 'balance) balance)
                ((eq? m 'serializer) balance-serializer)
                ((eq? m 'id) id)
                (else (error "Unknown request: MAKE-ACCOUNT" m))))
    dispatch))

(define (exchange account1 account2)
    (let ((difference (- (account1 'balance)
                       (account2 'balance))))
        ((account1 'withdraw) difference)
        ((account2 'deposit) difference)))


(define (serialized-exchange account1 account2) 
(let ((serializer1 (account1 'serializer))
        (serializer2 (account2 'serializer))
        (id1 (account1 'id))
        (id2 (account2 'id)))
    (if (< id1 id2) 
        ((serializer1 (serializer2 exchange))
        account1
        account2)
        ((serializer2 (serializer1 exchange))
        account1
        account2))))

; we avoid the deadlock in this case by ordering the lock
; we force the process to to always atenpt to enter a procedure protecting
;the lowest-numbered account first so the second concurent action
; cannot access the bigger-numbered account and cause a deadlock