(load "test-manager/load.scm")
(load "ch-5/ex-5-19.scm")

(define rec-expt-machine 
  (make-machine 
    '(n b val continue) 
    (list (list '* *) (list '- -) (list '= =)) 
    '((assign continue (label expt-done))
  expt-loop
  (test (op =) (reg n) (const 0))
  (branch (label base-case))
  (save continue)
  (assign n (op -) (reg n) (const 1))
  (assign continue (label after-expt))
  (goto (label expt-loop))
  after-expt
  (restore continue) 
  (assign val (op *) (reg val) (reg b))
  (goto (reg continue))
  base-case
  (assign val (const 1))
  (goto (reg continue))
  expt-done)))

(define-each-test
(let ((machine (make-machine '(a) '() '(label( assign a (const 2))(assign a (const 1)) ))))
  (set-breakpoint machine 'label 2)
  (start machine)
  (check (= (get-register-contents machine 'a) 2) "should be able to set a breakpoint")
  )

(let ((machine (make-machine '(a) '() '(label( assign a (const 2)) (goto (label label-2)) label-2 (assign a (const 1)) ))))
  (set-breakpoint machine 'label-2 1)
  (start machine)
  (check (= (get-register-contents machine 'a) 2) "should be able to set a breakpoint after a specific label when the machine got to this label with a goto label")
  )

(let ((machine (make-machine '(a continue) '() '(  label ( assign a (const 2)) (assign continue (label label-2)) (goto (reg continue)) label-2 (assign a (const 1)) ))))
  (set-breakpoint machine 'label-2 1)
  (start machine)
  (check (= (get-register-contents machine 'a) 2) "should be able to set a breakpoint after a specific label when the machine got to this label with a goto register")
  )

(let ((machine (make-machine '(a ) (list (list '= =)) '(label ( assign a (const 2)) (test (op =) (reg a) (const 2) ) (branch (label if) )  if (assign a (const 1)) ))))
  (set-breakpoint machine 'if 1)
  (start machine)
  (check (= (get-register-contents machine 'a) 2) "should be able to set a breakpoint after a specific label when the machine got to this label with branch")
  )

(let ((machine (make-machine '(a) '() '(label( assign a (const 2))(assign a (const 1)) ))))
  (set-breakpoint machine 'label 2)
  (cancel-breakpoint machine 'label 2)
  (start machine)
  (check (= (get-register-contents machine 'a) 1) "should be able to cancel a specific breakpoints")
  )

(let ((machine (make-machine '(a) '() '(label( assign a (const 2)) (assign a (const 3)) (assign a (const 1)) ))))
  (set-breakpoint machine 'label 2)
  (set-breakpoint machine 'label 3)
  (cancel-all-breakpoints machine)
  (start machine)
  (check (= (get-register-contents machine 'a) 1) "should be able to cancel all the breakpoints")
  )

(let ((machine (make-machine '(a) '() '(label( assign a (const 2)) (assign a (const 3)) (assign a (const 1)) ))))
  (set-breakpoint machine 'label 2)
  (set-breakpoint machine 'label 3)
  (start machine)
  (proceed-machine machine)
  (check (= (get-register-contents machine 'a) 3) "should be able to continue the execution after that one breakpoint has been hit")
  (proceed-machine machine)
  (check (= (get-register-contents machine 'a) 1) "should be able to continue the execution after that one breakpoint has been hit")
  )

)





(run-registered-tests)
