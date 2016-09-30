(define (sub-interval a b)
  (let ((p1 (- (lower-bound a) (lower-bound b)))
        (p2 (- (lower-bound a) (upper-bound b)))
        (p3 (- (upper-bound a) (lower-bound b)))
        (p4 (- (upper-bound a) (upper-bound b))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))