(load "test-manager/load.scm")
(load "ch-5/ex-5-21.scm")

(define-each-test
  (let ((machine (make-count-leaves-machine-rec)))
    (set-register-contents! machine 'tree '())
    (start machine)
    (check (= (get-register-contents machine 'count ) 0) "should not count anything when there is no branch" )
    )
)







(run-registered-tests)
