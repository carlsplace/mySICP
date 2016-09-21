(define (quotient a b)
  (/ (- a (remainder a b)) b))

(define (cont-frac n d k) 
   (define (frac-rec i) 
     (/ (n i) 
        (+ (d i) 
           (if (= i k) 
               0 
               (frac-rec (+ i 1)))))) 
   (frac-rec 1)) 

(cont-frac (lambda (i) 1.0)
           (lambda (i) (if (= (quotient i 3) 2)
                           (* 2 (+ (quotient i 3) 1))
                           1))
           10000)

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 1))
(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) (if (= (quotient i 3) 2)
                                (* 2 (+ (quotient i 3) 1))
                                1))
                10000)