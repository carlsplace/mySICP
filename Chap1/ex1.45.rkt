(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 0)
      identity
      (compose f (repeated f (- n 1)))))
(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x)) 2)))
(define (repeated-damp n)
  (repeated average-damp n))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
          next
          (try next))))
  (try first-guess))

(define (n-th-power x n)
  (define (iter i result)
    (if (> i n)
        result
        (iter (+ i 1) (* x result))))
  (iter 1 1))

(define (log2-floor n) (floor (/ (log n) (log 2))))
(define (n-th-root n x)
  (define d (log2-floor n))
  (fixed-point ((repeated-damp d) (lambda (y) (/ x (n-th-power y (- n 1)))))
               1.0))
(n-th-root 5 2)
                