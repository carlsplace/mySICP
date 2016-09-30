(define (lenth list)
  (define (iter a count)
    (if (null? a)
        count
        (iter (cdr a)
              (+ 1 count))))
  (iter list 0))
(define (reverse items)
  (define (iter a result)
    (if (null? a)
        result
        (iter (cdr a) (cons (car a) result))))
  (iter items nil))
(define (reverse-r items)
  (if (null? (cdr items))
      nil
      (append (reverse (cdr items))
              (cons (car items) nil))));递归写法，注意，不一定是以(reverse .....)开头，子问题分解要理清楚。

(define squares (list 1 4 9 16 25))
(display squares)
(newline)
(display (reverse squares))
(newline)
(display (reverse-r squares))