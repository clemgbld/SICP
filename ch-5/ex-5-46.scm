(load "ch-5/ch5-regsim.scm")

(define fib-machine ( make-machine 
      '(n continue val) 
      (list (list '< <) (list '- -) (list '+ +))
'(controller
   (assign continue (label fib-done))
fib-loop
(test (op <) (reg n) (const 2))
(branch (label immediate-answer))
(save continue)
(assign continue (label afterfib-n-1))
(save n) 
(assign n (op -) (reg n) (const 1)) 
(goto (label fib-loop))
afterfib-n-1 
(restore n)
(restore continue)
(assign n (op -) (reg n) (const 2)) 
(save continue)
(assign continue (label afterfib-n-2)) 
(save val) 
(goto (label fib-loop))
afterfib-n-2 
(assign n (reg val))
(restore val)
(restore continue)
(assign val (op +) (reg val) (reg n))
(goto (reg continue))
immediate-answer
  (assign val (reg n))
  (goto (reg continue))
  fib-done
  (perform (op print-stack-statistics))
  )))

(define (fib-print n) 
(set-register-contents! fib-machine 'n n)
(display (list "FIB MACHINE INPUT:" n))
(newline)
(start fib-machine)
(newline)
(display (list "FIB MACHINE RESULT" (get-register-contents fib-machine 'val)) )
(newline)
)

(for-each fib-print '( 2 3 4 5 6 7 8 9 10))
