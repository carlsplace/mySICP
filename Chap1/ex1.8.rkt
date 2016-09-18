(define (cubert-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cubert-iter (improve guess x) x)))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess guess2)
  (< (abs (- guess guess2)) 0.001))
(define (square x) (* x x))
(define (cubert x)
  (cubert-iter 1.0 x))

(cubert 0.001)