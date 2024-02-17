(load "test-manager/load.scm")
(load "ch-3/ex-3-3.scm")

(define-each-test
(let ((account (make-account 100 'some-secret-password)))
    (check (= 110 ((account 'some-secret-password 'deposit) 10)) "should be able to make a deposit"))
(let ((account (make-account 100 'some-secret-password)))
    (check (= 90 ((account 'some-secret-password 'withdraw) 10)) "should be able to withdraw money"))

(let ((account (make-account 100 'some-secret-password)))
    (check (equal? "Insufficient funds" ((account 'some-secret-password 'withdraw) 101)) "should not let the account withdraw money when it has not enough money"))

(let ((account (make-account 100 'some-secret-password)))
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'deposit) 10)) "should not let the user make a withdral when the user give a wrong password"))

(let ((account (make-account 100 'some-secret-password)))
    (check (equal? "Incorrect password" ((account 'some-other-secret-password 'withdraw) 10)) "should not let the user make a deposit when the user give a wrong password"))
)

(run-registered-tests)