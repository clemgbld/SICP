(rule (same ?x ?x))

(rule (can-replace ?person1 ?person1)
    (and (job ?person1 ?job1) 
        (job ?person2 ?job2) 
        (or (same ?job1 ?job2) (can-do-job ?job1 ?job2))
        (not (same ?person1 ?person2))))

;a) all people who can replace Cy D. Fect; 

(can-replace ?person (Fect Cy D))

;b) all people who can replace someone who is being paid more than they are, together with the two salaries.

(and 
    (can-replace ?person1 ?person2)
    (salary ?person1 ?salary1)
    (salary ?person2 ?salary2)
    (lisp-value < ?salary1 ?salary2))