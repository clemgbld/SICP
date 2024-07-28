(load "ch-5/ch5-regsim.scm")

(define make-count-leaves-machine-rec 
(lambda () (make-machine '(tree count) (list ) '((assign count (const 0) )) ))  )


