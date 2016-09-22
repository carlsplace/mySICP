(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ ((lambda (n) (if (<= (* n d) 0) (- (abs n)) (abs n))) n)
             g)
          (/ ((lambda (d) (abs d)) d)
             g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 9 -18))