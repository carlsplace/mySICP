(define (cc amount coin-values)
  (cond ((= amount 0)
         1)
        ((or (< amount 0)
             (no-more? coin-values))
         0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount (first-denomination coin-values))
                coin-values)))))
(define (no-more? coin-values)
  (= 0 (lenth coin-values)))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (first-denomination coin-values)
  (car coin-values))
(define (lenth list)
  (define (iter a count)
    (if (null? a)
        count
        (iter (cdr a)
              (+ 1 count))))
  (iter list 0))

(define us-coins
  (list 50 25 10 5 1))
(define us-coins2
  (list 10 25 5 1 50))
(define us-coins3
  (list 5 1 50 10 25))
(define uk-coins
  (list 100 50 20 10 5 2 1 0.5))

(cc 100 us-coins)
(cc 100 us-coins2)
(cc 100 us-coins3)