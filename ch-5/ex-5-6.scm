(controller
   (assign continue (label fib-done))
fib-loop
(test (op <) (reg n) (const 2))
(branch (label immediate-answer))
(save continue)
(assign continue (label afterfib-n-1))
(save n) 
(assign n (op -) (reg n) (const 1)) 
afterfib-n-1 
; we can delete this line below
(restore continue)
(assign n (op -) (reg n) (const 2)) 
; we can delete this line below
(save continue)
(assign continue (label afterfib-n-2)) (save val) 
afterfib-n-2 
(assign n (reg val))
(restore val)
(restore continue)
(assign val
  (goto (reg continue))
immediate-answer
  (assign val (reg n))
  (goto (reg continue))
  fib-done)
