(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (let ((guess-improved (improve guess)))
      (if (good-enough? guess-improved guess)
          guess-improved
          ((iterative-improve good-enough? improve) guess-improved)))))

(define (good-enough? a b)
  (< (abs (- a b)) 0.00001))

; rewrite sqrt
(define (sqrt x)
  ((iterative-improve good-enough?
                     (lambda (y)
                       (/ (+ y (/ x y)) 2)))
   1.0))
(sqrt 2)

; rewrite fixed-point
(define (fixed-point f first-guess)
  ((iterative-improve good-enough? f) first-guess))
(fixed-point cos 1.0)
                        