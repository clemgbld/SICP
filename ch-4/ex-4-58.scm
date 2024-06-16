(rule (same ?x ?x))

(rule (bigshot ?person)
    (and 
        (job ?person (?person-division . ?rest-1))
        (or (not (supervisor ?person ?supervisor))
           (and (supervisor ?person ?supervisor)
            (not (job ?supervisor (?person-division . ?rest-2)))))))