;Orginal version
(define (parse-verb-phrase)
(define (maybe-extend verb-phrase)
    (amb verb-phrase
    (maybe-extend
          (list 'verb-phrase
                verb-phrase
                (parse-prepositional-phrase)))))
  (maybe-extend (parse-word verbs)))

;Louis Reasoner's version
(define (parse-verb-phrase) 
    (amb (parse-word verbs) 
        (list 'verb-phrase
                (parse-verb-phrase)
                (parse-prepositional-phrase))))

;Louis Reasoner's version has a subtle bug in it that cause 
;an infinite loop to occur because if the (parse-prepositonal-phase) doesn't succeed and the (parse-verb-phrase) before it succed 
;the program try to call (parse-verb-phrase) indefinetly


