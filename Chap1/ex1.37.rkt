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

;recursion 子问题分解要正确，注意和iter之间的区别，iter是有k到1，recur是有1到k。iter的关键点是有一个“存档”的地方，保存了中间态，若是从1到k则iter无法保存中间态。
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