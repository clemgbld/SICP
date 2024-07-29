(load "ch-5/ch5-regsim.scm")

(define make-count-leaves-machine-rec 
(lambda () 
  (make-machine '(tree count first continue) 
                (list (list '+ +) 
                      (list 'car car) 
                      (list 'cdr cdr ) 
                      (list 'null? null? )
                      (list 'pair? pair? )
                      (list 'not-pair?' (lambda (p) (not (pair? p)) ) )
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


