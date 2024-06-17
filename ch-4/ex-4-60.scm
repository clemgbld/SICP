(rule (same ?x ?x))

(rule (lives-near ?person-1 ?person-2)
(and (address ?person-1 (?town . ?rest-1)) 
    (address ?person-2 (?town . ?rest-2))
           (not (same ?person-1 ?person-2))))

(livers-near ?person-1 ?person-2)

(lives-near (Hacker Alyssa P) (Fect Cy D))
(lives-near (Fect Cy D) (Hacker Alyssa P))

;Why does this happen? Is there a way to find a list of people who live near each other, in which each pair appears only once? Explain.

;it happen because it tries all the combination by replacing ?person-1 and ?person-2 by all the existing person in the database

;at this point with our current knowledge about the query language i'm not sure how to handle that maybe we should force the ?person-1 to be greater in alphabetic order that the ?person-2 but that would make some other issues