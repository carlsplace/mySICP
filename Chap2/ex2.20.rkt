(define (same-parity a . l)
  (define (iter l result)
    (if (null? l)
        result
        (iter (cdr l) (if (or (and (odd? a) (odd? (car l)))
                              (and (even? a) (even? (car l))))
                          (append result (list (car l)))
                          result))))
  (iter l (list a)))
   
(display (same-parity 1 2 3 4 5 6 7))
(newline)
(display (same-parity 2 3 4 5 6 7))
(newline)

;http://community.schemewiki.org/?sicp-ex-2.20
 (define (same-parity-r . L) 
   (define (filter x) 
     (if (even? x) 
         even? 
         odd?)) 
   (define (construct f L) 
     (cond ((null? L) '()) 
           ((f (car L)) (cons (car L)
                              (construct f (cdr L)))) 
           (else (construct f (cdr L))))) 
   (construct (filter (car L)) L))
  
(display (same-parity-r 1 2 3 4 5 6 7))
(newline)
(display (same-parity-r 2 3 4 5 6 7))