(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 1))

(define (cont-frac n d k) 
(define (frac-rec i) 
 (/ (n i) 
    (+ (d i) 
       (if (= i k) 
           0 
           (frac-rec (+ i 1)))))) 
(frac-rec 1)) 

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (- (* x x))));使用λ方便以后修改
                  (lambda (i) (- (* 2 i) 1))
                  k))
(tan-cf 1.0 100)

(define (tan-cf-iter x k)
  (cont-frac-iter (lambda (i) (if (= i 1) x (- (* x x))));使用λ方便以后修改
                  (lambda (i) (- (* 2 i) 1))
                  k))
(tan-cf-iter 1.0 100)