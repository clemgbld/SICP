(load "test-manager/load.scm")
(load "ch-3/ex-3-4.scm")

(define-each-test
(let ((account (make-account 100 'some-secret-password)))
    (check (= 110 ((account 'some-secret-password 'deposit) 10)) "should be able to make a deposit"))
(let ((account (make-account 100 'some-secret-password)))
    (check (= 90 ((account 'some-secret-password 'withdraw) 10)) "should be able to withdraw money"))

(let ((account (make-account 100 'some-secret-password)))
    (check (equal? "Insufficient funds" ((account 'some-secret-password 'withdraw) 101)) "should not let the account withdraw money when it has not enough money"))

(let ((account (make-account 100 'some-secret-password)))
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'deposit) 10)) "should not let the user make a deposit when the user give a wrong password"))

(let ((account (make-account 100 'some-secret-password)))
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password"))

(let ((account (make-account 100 'some-secret-password)))
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'deposit) 10)) "should not let the user make a deposit when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'deposit) 10)) "should not let the user make a deposit when the user give a wrong password")
    (check (equal? "Cops called" ((account 'some-other-secret-password 'withdraw) 10)) "should call the cops when the user enter a wrong password 7 times")
    (check (equal? "Cops called" ((account 'some-other-secret-password 'withdraw) 10)) "should call the cops when the user enter a wrong password 7 times")
    )
    
    (let ((account (make-account 100 'some-secret-password)))
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")

    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? 110 ((account 'some-secret-password 'deposit) 10)) "should make a deposit")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'deposit) 10)) "should not let the user make a deposit when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'deposit) 10)) "should not let the user make a deposit when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    )

(let ((account (make-account 100 'some-secret-password)))
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    (check (equal? 90 ((account 'some-secret-password 'withdraw) 10)) "should make a withdrawal")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'deposit) 10)) "should not let the user make a deposit when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'deposit) 10)) "should not let the user make a deposit when the user give a wrong password")
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a withdral when the user give a wrong password")
    )
    
    )



(run-registered-tests)