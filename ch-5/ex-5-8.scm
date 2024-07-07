(load "ch-5/ch5-regsim.scm")

(define bad-machine 
  (make-machine 
    '(a)
    (list )
    '(

      start
        (goto (label here))
      here
        (assign a (const 3))
        (goto (label there))
      here
        (assign a (const 4))
        (goto (label there))
there
       )
    )
  )

; the content of the register a will be 3 because assoc take the first occurence in a the list
(define (extract-labels text receive) 
  (if (null? text)
      (receive '() '())
      (extract-labels
(cdr text)
(lambda (insts labels)
(let ((next-inst (car text))) 
  (if (symbol? next-inst)
        (if (assoc next-inst labels) 
          (error "LABEL already defined" next-inst)
          (receive insts
                        (cons (make-label-entry next-inst
                              insts)
                              labels)))
               (receive (cons (make-instruction next-inst)
                              insts)
                        labels)))))))


  

