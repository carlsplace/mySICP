; not complete, how to prove it using Lisp?
(define (fib n)
  (define (iter a b count)
    (if (= count 0)
        b
        (iter (+ a b) a (- count 1))))
  (iter 1 0 n))
(define (sqrt n)
  (define (average a b)
    (/ (+ a b) 2))
  (define (square a) (* a a))
  (define (improve guess)
    (average guess (/ n guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) n)) 0.0000000001))
  (define (iter guess n)
    (if (good-enough? guess)
        guess
        (iter (improve guess) n)))
  (iter 1.0 n))
(define phi (/ (+ 1 (sqrt 5)) 2))
(define psi (/ (- 1 (sqrt 5)) 2))
(define (n-square a n)
  (define (iter a result count)
    (if (= count 0)
        result
        (iter a (* a result) (- count 1))))
  (iter a 1 n))

(define (golden n)
  (/ (n-square phi n) (sqrt 5)))

(define (compare n)
  (if (< (abs (- (fib n) (golden n))) 1)
      'true
      'false))

(compare 7)
      
