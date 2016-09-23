(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((a f) ((b f) x)))))

  
; 食用方法，可通过观察双层嵌套的lambda得出。
(define (square x) (* x x))
((two square) 2)
(((add (add-1 one) two) square) 2) ;2^16

((two sqrt) 4)