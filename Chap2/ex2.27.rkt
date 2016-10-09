(define (reverse items)
  (define (iter a result)
    (if (null? a)
        result
        (iter (cdr a) (cons (car a) result))))
  (iter items nil))

(define (deep-reverse items)
  (define (iter a result)
    (cond ((null? a) result)
          ((pair? (car a)) (iter (cdr a) (iter (car a) result)))
          (else (iter (cdr a) (cons (car a) result)))))
  (iter items nil))

(define (deep-reverse-2 items)
  (if (pair? items)
      (append (deep-reverse-2 (cdr items))
              (list (deep-reverse-2 (car items))))
      items))

         
(define (print x)
  (newline)
  (display x))

(define x (list (list 1 2) (list 3 4)))
(print (reverse x))
(print (deep-reverse-2 x))