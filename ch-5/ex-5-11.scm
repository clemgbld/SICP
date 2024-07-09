(load "ch-5/ch5-regsim.scm")

;a 

(define fib-machine 
  (make-machine '(n continue val) 
  (list (list '+ +) (list '- -) (list '< <) )
'((assign continue (label fib-done))
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
(assign n (op -) (reg n) (const 2))
(assign continue (label afterfib-n-2))
(save val) 
(goto (label fib-loop))
afterfib-n-2 
(restore n)
(restore continue)
(assign val (op +) (reg val) (reg n))
  (goto (reg continue))
immediate-answer
  (assign val (reg n))
  (goto (reg continue))
fib-done)))




