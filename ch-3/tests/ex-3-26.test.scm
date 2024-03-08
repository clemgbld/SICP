(load "test-manager/load.scm")
(load "ch-3/ex-3-26.scm")


(define-each-test
(let ((table (make-table < )))
   (assert-false ((table 'lookup-proc) (list 2)) "should be an empty lookup table in the begining")
   )

(let ((table (make-table < )))
   ((table 'insert-proc!) (list 1) 'a) 
   (assert-false ((table 'lookup-proc) (list 2)) "should be an empty lookup table in the begining")
   (check (equal? 'a ((table 'lookup-proc)(list 1))) "should find the expected value in a one dimensional lookup table")
   )

(let ((table (make-table < )))
   ((table 'insert-proc!) (list 1) 'a) 
   ((table 'insert-proc!) (list 2) 'b) 
   ((table 'insert-proc!) (list -1) 'c) 
   (check (equal? 'b ((table 'lookup-proc)(list 2))) "should be able to find the second element stored in the lookup table")
   (check (equal? 'c ((table 'lookup-proc)(list -1))) "should be able to find the third element stored in the lookup table")
   )

(let ((table (make-table < )))
   ((table 'insert-proc!) (list 1) 'a) 
   ((table 'insert-proc!) (list 2) 'b) 
   ((table 'insert-proc!) (list -1) 'c) 
   ((table 'insert-proc!) (list 4) 'd) 
   ((table 'insert-proc!) (list -2) 'e)
   ((table 'insert-proc!) (list 1) 'z)
   (check (equal? 'b ((table 'lookup-proc)(list 2))) "should find a stored element in a deep tree")
   (check (equal? 'c ((table 'lookup-proc)(list -1))) "should find a stored element in a deep tree")
   (check (equal? 'z ((table 'lookup-proc)(list 1))) "should be able to update the value of an existing record")
   )

(let ((table (make-table < )))
   ((table 'insert-proc!) (list 1 2) 'a) 
   (check (equal? (list (cons 2 'a) '() '()) ((table 'lookup-proc)(list 1))) "should find the expected value in an mutlti dimensional lookup table")
   (check (equal? 'a ((table 'lookup-proc)(list 1 2))) "should find the expected value in an mutlti dimensional lookup table")
   )

)



(run-registered-tests)