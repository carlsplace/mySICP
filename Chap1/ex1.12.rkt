(define (pascal row col)
  (cond ((or (< row 1) (< col 1) (> col row))
         'range_error)
        ((or (= col 1) (= row col)) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))
(pascal 1 1)
(pascal 4 2)
(pascal 7 4)
        
        