(define (f g) (g 2))
(f (lambda (z) (* z (+ z 1))))
(define x 2)
(let ((x 3)
      (y (+ x 2)))
  (* x y))

((lambda (x y) (* x y)) 3 (+ x 2))