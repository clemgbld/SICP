(rule (append-to-form () ?y ?y))

(rule (append-to-form (?u . ?v) ?y (?u . ?z))
      (append-to-form ?v ?y ?z))

(rule (reverse () ()))

(rule (reverse (?x . ?y) ?r)
    (and (reverse ?y ?ry) 
        (append-to-form ?y (?x) ?r)))

(reverse ?x (1 2 3)) ; cause an infinite loop