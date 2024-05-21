;a) 
;the value are printed correctly because the driver loop for the output before printing it  

;b)
;(p1 1)
;gives (1 2) with both eval-sequences

;(p2 1)
;gives 1 with the original eval-sequences and (1 2) with Cy's eval-sequences

;c)
;Yes Cy why is right for the first example we read x which is set in the first sequence with both eval-sequences which force the (set! x (cons x '(2))) and gives the same result with the two eval-sequences
;unlike the second example where the set! operation is passed as a delayed argument to a procedure and never forced by the orginal eval-sequences which gives 1 instead of (1 2)

;d)
;I prefer the one of the author because which requires the user of the language to know the underlaying evaluation process and i also think
;that Cy implementation is not worth it because gives up some performance improvement whenever we must evaluate a sequence in order to cover some edge cases that won't happen if you know how evaluation works



