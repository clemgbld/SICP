(load "test-manager/load.scm")
(load "ch-2/ex-2-9.scm")



(define-each-test 
(check (= (width-interval (add-interval (make-interval 7 3) (make-interval 2 5))) (+ (width-interval (make-interval 7 3)) (width-interval (make-interval 2 5)))) "width of an interval + another interval should be the same than the width of two interval added together")
(check (= (width-interval (sub-interval (make-interval 7 3) (make-interval 2 5))) (+ (width-interval (make-interval 7 3)) (width-interval (make-interval 2 5)))) "width of an interval - another interval should be the same than the width of two interval substracted by the width of the added together")
(check (not (= (width-interval (mul-interval (make-interval 7 3) (make-interval 2 5))) (+ (width-interval (make-interval 7 3)) (width-interval (make-interval 2 5)))) )"width of an interval - another interval should be the same than the width of two interval substracted by the width of the other interval"))




(run-registered-tests)

