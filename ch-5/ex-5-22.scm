(load "ch-5/ch5-regsim.scm")

(define  make-append!-machine 
  (lambda () 
    (make-machine '(x y last-pair cdr-last-pair ) 
                  (list (list 'null? null?) 
                        (list 'set-cdr! set-cdr!) 
                        (list 'car car) 
                        (list 'cdr cdr ) ) 
                  '(
                    (assign last-pair (reg x))
                    last-pair-loop
                    (assign cdr-last-pair (op cdr) (reg last-pair) )
                    (test (op null?) (reg cdr-last-pair)) 
                    (branch (label base-case) )
                    (assign last-pair (reg cdr-last-pair))
                    (goto (label last-pair-loop) )
                    base-case
                    (perform (op set-cdr!) (reg last-pair) (reg y ))
                    ) )) )

(define  make-append-machine 
  (lambda () 
    (make-machine '(x y n val continue) 
                  (list (list 'null? null?) 
                        (list 'car car) 
                        (list 'cons cons) 
                        (list 'cdr cdr ) ) 
                  '(
                   (assign continue (label done))
                   loop
                   (test (op null?) (reg x) )
                   (branch (label base-case))
                   (save continue)
                   (assign continue (label rewind) )
                   (assign n (op car) (reg x) )
                   (save n)
                   (assign x (op cdr) (reg x) )
                   (goto (label loop))
                   rewind
                   (restore n)
                   (restore continue)
                   (assign val (op cons) (reg n) (reg val) )
                   (goto (reg continue))
                   base-case 
                   (assign val (reg y) )
                   (goto (reg continue))
                   done
                    ) )) )

