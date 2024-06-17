(rule (grandson ?g ?s)
    (and (son-of ?f ?s) (son-of ?g ?f)))

(rule (son-of ?m ?s)
    (or (and (wife ?w ?m) (son ?w ?s)) 
        (son ?m ?s)))

(grandson Cain ?s)

(son-of Lamech ?s)

(grandson Methushael ?s)