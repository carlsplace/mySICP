(define (square x) (* x x))
(define (divides? a b)
  (= (remainder b a) 0))
(define (smallest-divisor n)
  (define (find-divisor n test)
    (cond ((> (square test) n) n)
          ((divides? test n) test)
          (else (find-divisor n (+ test 1)))))
  (find-divisor n 2))
(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)