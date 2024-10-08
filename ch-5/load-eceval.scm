;;;; LOADS THE EXPLICIT-CONTROL EVALUATOR FROM SECTION 5.4 OF
;;;; STRUCTURE AND INTERPRETATION OF COMPUTER PROGRAMS, WITH
;;;; ALL THE SUPPORTING CODE IT NEEDS IN ORDER TO RUN.

;;;; **NB** The actual "load" calls are implementation dependent.

(load "ch-5/ch5-regsim")			;reg machine simulator

;; **NB** next file contains another "load"
(load "ch-5/ch5-eceval-support")		;simulation of machine operations

(load "ch-5/ch5-eceval")			;eceval itself
