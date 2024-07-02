;a) Recursive exponentiation

(define (expt b n)
    (if (= n 0) 
        1
        (* b (expt b (- n 1)))


(controller 
  (assign continue (label expt-done))
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
  expt-done)

;b) Iterative exponentiation

(define (expt b n)
  (define (expt-iter product counter)
    (if (= counter 0)
      product
      (expt-iter (* b product) (- counter 1))))
    (expt-iter 1 n))

(controller
  (assign p (const 1))
  (assign c (reg n))
  expt-loop
  (test (op =) (reg c) (const 0))
  (branch (label done))
  (assign p (op *) (reg p) (reg b))
  (assign c (op -) (reg c) (const 1))
  (goto (label expt-loop))
  done
)
