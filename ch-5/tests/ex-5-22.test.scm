(load "test-manager/load.scm")
(load "ch-5/ex-5-22.scm")

(define-each-test
  (let ((machine (make-append!-machine) ))
    (set-register-contents! machine 'x '(1 2 3 4 5) )
    (set-register-contents! machine 'y '(1 2) )
    (start machine)
    (check (equal? (get-register-contents machine 'x) 
                   '(1 2 3 4 5 1 2) ) "should append by mutating x" ) ) 
    )

(define-each-test
  (let ((machine (make-append-machine) ))
    (set-register-contents! machine 'x '(1) )
    (set-register-contents! machine 'y '(2 3) )
    (start machine)
    (check (equal? (get-register-contents machine 'val) 
                   '(1 2 3) ) "can do the simplest append" ) ) 

(let ((machine (make-append-machine) ))
    (set-register-contents! machine 'x '(1 2 3 4 5) )
    (set-register-contents! machine 'y '(1 2) )
    (start machine)
    (check (equal? (get-register-contents machine 'val) 
                   '(1 2 3 4 5 1 2) ) "can append" ) )

    )




(run-registered-tests)
