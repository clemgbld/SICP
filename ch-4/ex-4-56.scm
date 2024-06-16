;a)the names of all people who are supervised by Ben Bitdiddle, together with their addresses; 

(and 
    (supervisor ?person (Bitdiddle Ben))
    (address ?person ?where))

;b) all people whose salary is less than Ben Bitdiddle’s, together with their salary and Ben Bitdiddle’s salary 

(and 
    (salary (Bitdiddle Ben) ?ben-bitdiddle-salary)
    (and 
        (salary ?person ?salary) 
        (lisp-value < ?salary ?ben-bitdiddle-salary)))

;c) all people who are supervised by someone who is not in the computer division, together with the supervisor’s name and job 

(and 
    (supervisor ?person ?supervisor)
    (job ?supervisor ?job)
    (not (job ?supervisor (computer . ?y))))