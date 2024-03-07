(load "test-manager/load.scm")
(load "ch-3/ex-3-26.scm")


(define-each-test
(let ((table (make-table < )))
   (assert-false ((table 'lookup-proc) (list 2)) "should be an empty lookup table in the begining")
   )

(let ((table (make-table < )))
   ((table 'insert-proc!) (list 1) 'a) 
   (assert-false ((table 'lookup-proc) (list 2)) "should be an empty lookup table in the begining")
   (check (equal? 'a ((table 'lookup-proc)(list 1))) "should find the expected value in a two dimensional lookup table")
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
   (check (equal? 'b ((table 'lookup-proc)(list 2))) "should find a stored element in a deep tree")
   )

)



(run-registered-tests)