(rule (?x next-to ?y in (?x ?y . ?u)))
(rule (?x next-to ?y in (?v . ?z))
    (?x next-to ?y in ?z))

What will the response be to the following queries?

(?x next-to ?y in (1 (2 3) 4)) 

((2 3) next-to 4 in (1 (2 3) 4))
(1 next-to (2 3) in (1 (2 3) 4))

(?x next-to 1 in (2131))

(2 next to 1 in (2131))
(3 next to 1 (2131))
