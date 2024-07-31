(load "test-manager/load.scm")
(load "ch-5/ex-5-21.scm")

(define-each-test
  (let ((machine (make-count-leaves-machine-explicit-counter)))
    (set-register-contents! machine 'tree '())
    (start machine)
    (check (= (get-register-contents machine 'count ) 0) "should not count anything when there is no branch" )
    )

(let ((machine (make-count-leaves-machine-explicit-counter)))
    (set-register-contents! machine 'tree '(1))
    (start machine)
    (check (= (get-register-contents machine 'count ) 1) "should be able to count the branch of the simplest tree" )
    )

(let ((machine (make-count-leaves-machine-explicit-counter)))
    (set-register-contents! machine 'tree '(1 2 3))
    (start machine)
    (check (= (get-register-contents machine 'count ) 3) "should be able to count the branches of a simple flat tree" )
    )

(let ((machine (make-count-leaves-machine-explicit-counter)))
    (set-register-contents! machine 'tree '(1 (1 2) 3))
    (start machine)
    (check (= (get-register-contents machine 'count ) 4) "should be able to count the branches of a multi level tree" )
    )

(let ((machine (make-count-leaves-machine-explicit-counter)))
    (set-register-contents! machine 'tree '(1 (1 2)  (1 (2 3))))
    (start machine)
    (check (= (get-register-contents machine 'count ) 6) "should pass the acceptance test" )
    )

)

(define-each-test
  (let ((machine (make-count-leaves-machine)))
    (set-register-contents! machine 'tree '())
    (start machine)
    (check (= (get-register-contents machine 'val ) 0) "should not count anything when there is no branch" )
    )

(let ((machine (make-count-leaves-machine)))
    (set-register-contents! machine 'tree '(1))
    (start machine)
    (check (= (get-register-contents machine 'val ) 1) "should be able to count the branch of the simplest tree" )
    )

(let ((machine (make-count-leaves-machine)))
    (set-register-contents! machine 'tree '(1 2 3))
    (start machine)
    (check (= (get-register-contents machine 'val ) 3) "should be able to count the branches of a simple flat tree" )
    )

(let ((machine (make-count-leaves-machine)))
    (set-register-contents! machine 'tree '(1 (1 2) 3))
    (start machine)
    (check (= (get-register-contents machine 'val ) 4) "should be able to count the branches of a multi level tree" )
    )

(let ((machine (make-count-leaves-machine)))
    (set-register-contents! machine 'tree '(1 (1 2)  (1 (2 3))))
    (start machine)
    (check (= (get-register-contents machine 'val ) 6) "should pass the acceptance test" )
    )



)







(run-registered-tests)
