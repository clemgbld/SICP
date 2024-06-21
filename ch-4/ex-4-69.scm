(rule (grandson ?g ?s)
    (and (son-of ?f ?s) (son-of ?g ?f)))

(rule (son-of ?m ?s)
    (or (and (wife ?w ?m) (son ?w ?s)) 
        (son ?m ?s)))

(rule (last-pair (?last) ?last))

(rule (last-pair (?u . ?v) ?last)
    (last-pair ?v (?u . ())))

(rule ((grandson) ?g ?s) (grandson ?g ?s))

(rule ((great . ?rel) ?x ?y)
    (and (son-of ?x ?z)
        (?rel ?z ?y)
        (?last-pair ?rel (grandson))))


(son Adam Cain)
(son Cain Enoch)
(son Enoch Irad)
(son Irad Mehujael)
(son Mehujael Methushael)
(son Methushael Lamech)
(wife Lamech Ada)
(son Ada Jabal)
(son Ada Jubal)
