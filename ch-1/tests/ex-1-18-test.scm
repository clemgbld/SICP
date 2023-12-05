(load "test-manager/load.scm")
(load "ch-1/ex-1-18.scm")


(define-each-test
(check (= 4 (multiply 2 2)) "2 times 2 should b 4")
(check (= 25 (multiply 5 5)) "5 times 5 should b 5")
(check (= 72 (multiply 8 9)) "8 times 9 should b 72")
(check (= 81 (multiply 9 9)) "9 times 9 should b 81")
)





(run-registered-tests)