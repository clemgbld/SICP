(load "ch-5/ch5-regsim.scm")

(define fact-machine ( make-machine 
      '(n continue val) 
      (list (list '= =) (list '- -) (list '* *))
'(
(perform (op initialize-stack))
 (assign continue (label fact-done))
fact-loop
  (test (op =) (reg n) (const 1))
  (branch (label base-case))
  (save continue)
  (save n)
  (assign n (op -) (reg n) (const 1))
  (assign continue (label after-fact))
  (goto (label fact-loop))
after-fact
  (restore n)
  (restore continue)
  (assign val (op *) (reg n) (reg val))  !
  (goto (reg continue))
base-case
  (assign val (const 1))
  (goto (reg continue))
fact-done
(perform (op print-stack-statistics))
)))

(define (fib-print n) 
(set-register-contents! fact-machine 'n n)
(display (list "FACT MACHINE INPUT:" n))
(newline)
(start fact-machine)
(newline)
(display (list "FACT MACHINE RESULT" (get-register-contents fact-machine 'val)) )
(newline)
)

(for-each fib-print '( 2 3 4 5 6 7 8 9 10))

#|
 (total-pushes = 0 maximum-depth = 0)
(FACT MACHINE RESULT 1)
(FACT MACHINE INPUT: 2)

(total-pushes = 2 maximum-depth = 2)
(FACT MACHINE RESULT 2)
(FACT MACHINE INPUT: 3)

(total-pushes = 4 maximum-depth = 4)
(FACT MACHINE RESULT 6)
(FACT MACHINE INPUT: 4)

(total-pushes = 6 maximum-depth = 6)
(FACT MACHINE RESULT 24)
(FACT MACHINE INPUT: 5)

(total-pushes = 8 maximum-depth = 8)
(FACT MACHINE RESULT 120)
(FACT MACHINE INPUT: 6)

(total-pushes = 10 maximum-depth = 10)
(FACT MACHINE RESULT 720)
(FACT MACHINE INPUT: 7)

(total-pushes = 12 maximum-depth = 12)
(FACT MACHINE RESULT 5040)
(FACT MACHINE INPUT: 8)

(total-pushes = 14 maximum-depth = 14)
(FACT MACHINE RESULT 40320)
(FACT MACHINE INPUT: 9)

(total-pushes = 16 maximum-depth = 16)
(FACT MACHINE RESULT 362880)
(FACT MACHINE INPUT: 10)
|#
 

;2(n - 1)


