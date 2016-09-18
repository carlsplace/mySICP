(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y) (/ (+ x y) 2))
(define (good-enough? guess guess2)
  (< (abs (- guess guess2)) 0.001))
(define (square x) (* x x))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0)