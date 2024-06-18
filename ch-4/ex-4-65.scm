(rule (wheel ?person)
(and (supervisor ?middle-manager ?person)
(supervisor ?x ?middle-manager)))

(wheel ?who)


;;; Query results:
(wheel (Warbucks Oliver))
(wheel (Bitdiddle Ben))
(wheel (Warbucks Oliver))
(wheel (Warbucks Oliver))
(wheel (Warbucks Oliver))

;it because :

;the query that succeds are:

(rule (wheel (Warbucks Oliver))
    (and (supervisor (Bitdiddle Ben) (Warbucks Oliver))
        (supervisor (Hacker Alyssa P) (Bitdiddle Ben))))

(rule (wheel (Bitdiddle Ben))
    (and (supervisor (Hacker Alyssa P) (Bitdiddle Ben))
        (supervisor (Reasoner Louis) (Hacker Alyssa P) )))

(rule (wheel (Warbucks Oliver))
    (and (supervisor (Bitdiddle Ben) (Warbucks Oliver))
        (supervisor (Fect Cy D) (Bitdiddle Ben))))

(rule (wheel (Warbucks Oliver))
    (and (supervisor (Bitdiddle Ben) (Warbucks Oliver))
        (supervisor (Tweakit Lem E) (Bitdiddle Ben))))

(rule (wheel (Warbucks Oliver))
    (and (supervisor (Scrooge Eben) (Warbucks Oliver))
        (supervisor (Cratchet Robert) (Scrooge Eben))))
