
(load "test-manager/load.scm")
(load "ch-3/ex-3-25.scm")


(define-each-test
(let ((table (make-table)))
   ((table 'insert-proc!) (list 'letters 'a) 97) 
   (check (= 97 ((table 'lookup-proc)(list 'letters 'a))) "should find the expected value in a two dimensional lookup table")
   (assert-false ((table 'lookup-proc)(list 'letters 'b)) "should not find the expected value in a two dimensional lookup table")
   )

(let ((table (make-table)))
   ((table 'insert-proc!) (list 'letters 'a) 97) 
   ((table 'insert-proc!) (list 'letters 'b) 98) 
   (check (= 98 ((table 'lookup-proc)(list 'letters 'b))) "should find the expected value in a two dimensional lookup table")
   (assert-false ((table 'lookup-proc)(list 'math '+)) "should not find the expected value in a two dimensional lookup table")
)
 (let ((table (make-table)))
    ((table 'insert-proc!) (list 'a ) 97) 
    (check (= 97 ((table 'lookup-proc)(list 'a))) "should find the expected value in a any dimensional lookup table")
 )

(let ((table (make-table)))
    ((table 'insert-proc!) (list 'animal 'fish 'shark ) 1) 
    ((table 'insert-proc!) (list 'animal 'fish 'shark ) 2) 
    (check (= 2 ((table 'lookup-proc)(list 'animal 'fish 'shark))) "should pass the acceptance test")
 )
)



(run-registered-tests)