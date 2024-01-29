(load "ch-2/ex-2-68.scm")
(load "ch-2/ex-2-69.scm")

 (define song 
   '(GET A JOB 
     SHA NA NA NA NA NA NA NA NA 
     GET A JOB 
     SHA NA NA NA NA NA NA NA NA 
     WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP 
     SHA BOOM)) 

 (define rock-lyrics 
   '((A 2) 
     (BOOM 1) 
     (GET 2) 
     (JOB 2) 
     (NA 16) 
     (SHA 3) 
     (YIP 9) 
     (WAH 1))) 
  
(cons (length (encode song (generate-huffman-tree rock-lyrics)))  (* 3 (length song)))
