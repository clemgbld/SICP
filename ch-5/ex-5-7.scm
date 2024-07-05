(load "ch-5/ch5-regsim.scm")

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

(define iter-expt-machine 
  (make-machine 
    '(n b c p) 
    (list (list '* *) (list '- -) (list '= =)) 
    '((assign p (const 1))
  (assign c (reg n))
  expt-loop
  (test (op =) (reg c) (const 0))
  (branch (label done))
  (assign p (op *) (reg p) (reg b))
  (assign c (op -) (reg c) (const 1))
  (goto (label expt-loop))
  done)))

(set-register-contents! iter-expt-machine 'b 5)


(set-register-contents! iter-expt-machine 'n 3)

(set-register-contents! rec-expt-machine 'b 5)


(set-register-contents! rec-expt-machine 'n 3)


