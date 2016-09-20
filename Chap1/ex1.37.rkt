;http://community.schemewiki.org/?sicp-ex-1.37
;iter is easy
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 1))

(cont-frac-iter (lambda (i) 1.0);使用λ方便以后修改
                (lambda (i) 1.0)
                100)

;recursion 子问题分解要正确，应该从最内层往外递归，而不是第一反应的从外向内递归，所以难写。
 (define (cont-frac n d k) 
   (define (frac-rec i) 
     (/ (n i) 
        (+ (d i) 
           (if (= i k) 
               0 
               (frac-rec (+ i 1)))))) 
   (frac-rec 1)) 

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)