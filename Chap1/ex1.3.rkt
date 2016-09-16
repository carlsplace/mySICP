(define (square x) (* x x))
(define (sof a b) (+ (square a) (square b)))
(define (sum-square-of-top2 a b c)
  (cond ((and (> a b) (< a c)) (sof a c))
        ((and (< a b) (< a c)) (sof b c))
        ((and (< a b) (> a c)) (sof a b))
        (else (sof a (if (> b c) b c)))))
(sum-square-of-top2 1 2 3)