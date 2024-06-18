(rule (outranked-by ?staff-person ?boss) 
    (or (supervisor ?staff-person ?boss)
    (and (outranked-by ?middle-manager ?boss) 
        (supervisor ?staff-person
                           ?middle-manager))))



(outranked-by (Bitdiddle Ben) ?who)

;Afer answering, the system goes into an infinite loop. Ex-
;plain why.

;it is because of the change of order in the and clause
;the rule call itself indefinatly because it call itself recursively before narrowing down to one middle-manager and then hit the base case
; in the or clause (supervisor ?staff-person ?boss) to exit the computation