(load "test-manager/load.scm")
(load "ch-1/ex-1-3.scm")


(define-test (sum-of-square-of-the-2-larger-numbers-when-3-numbers-are-zeros)
"should be zero"
(check (= 0 (sum-square-of-the-2-larger-numbers 0 0 0))))

 (define-test (sum-of-square-of-the-2-larger-numbers-when-1-number-is-not-zero)
"should be the value of the non zero number"
(check (= 1 (sum-square-of-the-2-larger-numbers 1 0 0))))

(define-test (sum-of-of-the-2-first-numbers)
"should be the sum of the two first numbers"
(check (= 2 (sum-square-of-the-2-larger-numbers 1 1 0))))

 (define-test (sum-of-square-of-the-2-first-numbers)
"should be the sum of the square of the two first numbers"
(check (= 13 (sum-square-of-the-2-larger-numbers 2 3 0))))

 (define-test (sum-of-square-of-the-first-and-third-number)
"should be the sum of the square of the first and third numbers"
(check (= 13 (sum-square-of-the-2-larger-numbers 2 1 3))))


 (define-test (sum-of-square-of-the-second-and-third-number)
"should be the sum of the square of the second and third numbers"
(check (= 13 (sum-square-of-the-2-larger-numbers 1 2 3))))

 (define-test (should-be-the-sum-of-the-square-of-the-two-largest-numbers-even-when-2-numbers-of-the-same)
"should be the sum of the square of the two largest numbers even when 2 numbers of the same"
(check (= 13 (sum-square-of-the-2-larger-numbers 2 3 2))))

(run-registered-tests)