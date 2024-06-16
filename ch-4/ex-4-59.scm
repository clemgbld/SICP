;a) On Friday morning, Ben wants to query the database for all the meetings that occur that day. What query should he use? 

(meeting ?div (Friday ?time)) 

;b) Alyssa P. Hacker is unimpressed. She thinks it would be much more useful to be able to ask for her meetings by specifying her name. So she designs a rule that says that a person’s meetings include all whole-company meetings plus all meetings of that person’s division. Fill in the body of Alyssa’s rule.

(rule (meeting-time ?person ?day-and-time)
    (or (meeting whole-company ?day-and-time)
         (and (job ?person (?div . ?rest)) 
            (meeting ?div ?day-and-time))))
;c) Alyssa arrives at work on Wednesday morning and wonders what meetings she has to aend that day. Having defined the above rule, what query should she make to find this out?
(meeting-time (Hacker Alyssa P) (Wednesday ?time))