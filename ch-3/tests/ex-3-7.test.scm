(load "test-manager/load.scm")
(load "ch-3/ex-3-7.scm")

(define-each-test 
    (let ((account (make-account 100 'some-secret-password)))
       (let ((joint-account (make-joint account 'some-secret-password 'new-password)))
       (check (= 110 ((joint-account 'new-password  'deposit) 10)) "the joint account should be able to make a deposit") 
       ))
    (let ((account (make-account 100 'some-secret-password)))
       (let ((joint-account (make-joint account 'some-secret-password 'new-password)))
       (check (= 90 ((joint-account 'new-password  'withdraw) 10)) "the joint account should be able to make a withdrwal") 
       ))

(let ((account (make-account 100 'some-secret-password)))
       (let ((joint-account (make-joint account 'some-secret-password 'new-password)))
       (check (equal? "Incorrect password" ((joint-account 'wrong-password  'withdraw) 10)) "should not let the joint account perform an operation if the password is not correct") 
       ))

(let ((account (make-account 100 'some-secret-password)))
       (let ((joint-account (make-joint account 'some-secret-password 'new-password)))
       (assert-true (joint-account 'new-password 'is-same-password?) "should be the same password") 
       ))

(let ((account (make-account 100 'some-secret-password)))
       (let ((joint-account (make-joint account 'some-secret-password 'new-password)))
       (assert-false (joint-account 'some-secret-password 'is-same-password?) "should not be the same password") 
       ))
)





(run-registered-tests)