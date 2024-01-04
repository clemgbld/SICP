(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))

(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile) 
    (cadr mobile))

(define (branch-length branch)
    (car branch))

(define (branch-structure branch)
    (cadr branch))

(define (mobile-structure side-proc)
    (lambda (mobile) 
        (branch-structure (side-proc mobile))))

(define left-structure (mobile-structure left-branch))

(define right-structure (mobile-structure right-branch))

(define (total-weight mobile) 
    (if (not (pair? mobile)) mobile 
        (+ (total-weight (left-structure mobile)) 
            (total-weight (right-structure mobile)))))        

(define (torque branch) (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? mobile) 
   (if (not (pair? mobile)) 
       true 
       (and (= (torque (left-branch mobile)) (torque (right-branch mobile))) 
            (balanced? (branch-structure (left-branch mobile))) 
            (balanced? (branch-structure (right-branch mobile)))))) 
  
