(load "ch-5/ch5-regsim.scm")

(define (not-pair? p) (not (pair? p) ))

;a
(define make-count-leaves-machine 
    (lambda () 
      (make-machine '(tree val n  continue) 
                    (list (list '+ +) 
                      (list 'car car) 
                      (list 'cdr cdr ) 
                      (list 'null? null? )
                      (list 'not-pair? not-pair? )
                      )
                    '(
                      (assign continue (label done) )
                      (assign n (const 0) )
                      loop
                      (test (op null?) (reg tree))
                      (branch (label null) )   
                      (test (op not-pair?) (reg tree))
                      (branch (label not-pair))
                      (save continue)
                      (assign continue (label after-car))
                      (save tree)
                      (assign tree (op car) (reg tree) )
                      (goto (label loop))
                       after-car 
                      (restore tree) 
                      (assign tree (op cdr) (reg tree)) 
                      (assign continue (label after-cdr)) 
                      (save val) 
                      (goto (label loop)) 
                      after-cdr 
                      (restore n) 
                      (restore continue) 
                      (assign val (op +) (reg val) (reg n)) 
                      (goto (reg continue)) 
                      not-pair
                      (assign val (const 1))
                      (goto (reg continue))
                      null
                      (assign val (const 0))
                      (goto (reg continue) )
                      done
                      )
                    )))

;b

(define make-count-leaves-machine-explicit-counter 
(lambda () 
  (make-machine '(tree count first continue) 
                (list (list '+ +) 
                      (list 'car car) 
                      (list 'cdr cdr ) 
                      (list 'null? null? )
                      (list 'pair? pair? )
                      ) 
                '(
                  (assign count (const 0) )
                  (assign continue (label done) )
                  loop
                  (test (op null?) (reg tree))
                  (branch (label imediate-answer) )
                  (assign first (op car) (reg tree) )
                  (assign tree (op cdr) (reg tree))
                  (test (op pair?) (reg first))
                  (branch (label node) )
                  (assign count (op +) (reg count) (const 1) )
                  (goto (label loop))
                  node
                  (save continue)
                  (save tree)
                  (assign tree (reg first) )
                  (assign continue (label done-node) )
                  (goto (label loop) )
                  imediate-answer
                  (goto (reg continue))
                  done-node
                  (restore tree)
                  (restore continue)
                  (goto (label loop) )
                  done 
                  ))))




