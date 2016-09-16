(define (f-recu n)
  (if (< n 3)
      n
      (+ (f-recu (- n 1)) (* 2 (f-recu (- n 2))) (* 3 (f-recu (- n 3))))))
(f-recu 5)
(f-recu -5)

(define (f-iter n)
  (define (iter a b c count)
    (cond ((= count 2) a)
          (else (iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
  (if (< n 3)
      n
      (iter 2 1 0 n)))
(f-iter 5)
(f-iter -5)