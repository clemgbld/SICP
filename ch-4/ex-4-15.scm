; proof by contradiction

 (define (try try) 
   (if (halts? try try) 
       (run-forever) 
       'halted)) 

;if (try try) halts it run-forever wich is not logical and
;if (try try) does not halts it is halted which is not logical too
