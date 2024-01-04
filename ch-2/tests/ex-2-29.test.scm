(load "test-manager/load.scm")
(load "ch-2/ex-2-29.scm")


(define-each-test
(check (equal? (list 1 2)  (left-branch (make-mobile (make-branch 1 2) (make-branch 3 4))))  "should get the left branch")
(check (equal? (list 3 4)  (right-branch (make-mobile (make-branch 1 2) (make-branch 3 4))))  "should get the right branch")
(check (= 1 (branch-length (make-branch 1 2))) "should get the length of the branch")
(check (= 2 (branch-structure (make-branch 1 2))) "should get the structure of the branch")
(check (= 1 (total-weight (make-mobile (make-branch 1 1) (make-branch 1 0)))) "should get the total weight of a mobile")
(check (= 2 (total-weight (make-mobile (make-branch 1 1) (make-branch 1 1)))) "should get the total weight of a mobile")
(check (= 4 (total-weight (make-mobile (make-branch 1 (make-mobile (make-branch 1 1) (make-branch 1 1))) (make-branch 1 (make-mobile (make-branch 1 1) (make-branch 1 1)))))) "should get the total weight of a mobile")
)




(run-registered-tests)