(define nouns '(noun student professor cat class)) 
(define verbs '(verb studies lectures eats sleeps)) 
(define articles '(article the a))
(define adjectives '(adjective happy sad bright dark quick slow hot cold tall short))
(define averbs '(adverbs quickly slowly quietly loudly happily sadly easily carefully gracefully suddenly))

(define (parse-sentence)
(list 'sentence (parse-noun-phrase) (parse-verb-phrase)))

(define (parse-adverb-phrase)
    (define (maybe-extend adverb-phrase)
        (amb adverb-phrase
            (maybe-extend 
                (list 'adverb-phrase (parse-words adverbs) adverb-phrase))
             (maybe-extend 
                (list 'adverb-phrase adverb-phrase (parse-words adverbs) ))))
                (maybe-extend (parse-word verbs)))

(define (parse-adjectivial-noun)
    (define (maybe-extend adjectivial-noun)
        (amb adjectivial-noun
            (maybe-extend 
                (list 'adjectivial-noun (parse-word adjectives adjectivial-noun)))))
    (maybe-extend (parse-word nouns)))

(define (parse-verb-phrase)
(define (maybe-extend verb-phrase)
    (amb verb-phrase
     (maybe-extend
          (list 'verb-phrase
                verb-phrase
                (parse-prepositional-phrase)))))
  (maybe-extend (parse-adverb-phrase)))

(define (parse-simple-noun-phrase) 
    (list 'simple-noun-phrase
        (parse-word articles)
(parse-adjectivial-noun)))


(define (parse-noun-phrase)
(define (maybe-extend noun-phrase) (amb noun-phrase
         (maybe-extend
          (list 'noun-phrase
                noun-phrase
                (parse-prepositional-phrase)))))
  (maybe-extend (parse-simple-noun-phrase)))


(define (parse-word word-list)
    (require (not (null? *unparsed*)))
    (require (memq (car *unparsed*) (cdr word-list))) 
    (let ((found-word (car *unparsed*)))
(set! *unparsed* (cdr *unparsed*)) 
    (list (car word-list) found-word)))

(define *unparsed* '())

(define (parse input)
(set! *unparsed* input)
(let ((sent (parse-sentence)))
(require (null? *unparsed*)) sent))


(define prepositions '(prep for to in by with))


(define (parse-prepositional-phrase) 
    (list 'prep-phrase
        (parse-word prepositions)
        (parse-noun-phrase)))



