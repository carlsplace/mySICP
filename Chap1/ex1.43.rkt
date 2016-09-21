(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 0)
      identity
      (compose f (repeated f (- n 1)))))
                  
(define (square x) (* x x))
((repeated square 3) 2)