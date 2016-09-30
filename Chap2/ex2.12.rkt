(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))

(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))

(define (make-center-percent center percentage)
  (make-interval (* center (+ 100 percentage) 0.01)
                 (* center (- 100 percentage) 0.01)))
(define (percent i)
  (* (/ (- (upper-bound i)
           (lower-bound i))
        2.0
        (center i))
     100))