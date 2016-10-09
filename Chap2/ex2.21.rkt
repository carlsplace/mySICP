(define (square x) (* x x))
(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items))
            (square-list (cdr items)))))

(define (square-list-map items)
  (map square items))
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items)) (map proc (cdr items)))))

(define test-list (list 1 2 4 5))
(square-list test-list)
(square-list-map test-list)