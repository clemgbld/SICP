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


;b

(define (make-save inst machine stack pc)
  (let* ((reg-name (stack-inst-reg-name inst)) 
         (reg (get-register machine reg-name)))
    (lambda ()
      (push stack (cons reg-name (get-contents reg)))
      (advance-pc pc))))


(define (make-restore inst machine stack pc)
  (let* ((reg-name (stack-inst-reg-name inst)) 
         (reg (get-register machine reg-name)))
    (lambda ()
      (let ((result (pop stack)))
       (if (eq? (car result) reg-name) 
         (begin (set-contents! reg (cdr result) )    
          (advance-pc pc))
       (error "the value is not from the register:" reg-name ))))))
