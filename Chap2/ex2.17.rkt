(define (last-pair1 list)
  (list-ref list (- (lenth list) 1)))
(define (lenth list)
  (define (iter a count)
    (if (null? a)
        count
        (iter (cdr a)
              (+ 1 count))))
  (iter list 0))
(last-pair1 (list 23 72 149 34))

(define (last-pair list)
  (if (null? (cdr list))
      list
      (last-pair (cdr list))))
(last-pair1 (list 23 72 149 34))