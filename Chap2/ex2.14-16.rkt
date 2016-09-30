(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))
(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))
(define (sub-interval a b)
  (let ((p1 (- (lower-bound a) (lower-bound b)))
        (p2 (- (lower-bound a) (upper-bound b)))
        (p3 (- (upper-bound a) (lower-bound b)))
        (p4 (- (upper-bound a) (upper-bound b))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "Division error (interval spans 0)" y)
      (mul-interval x
                    (make-interval
                     (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y))))))
(define (center i)
  (/ (+ (lower-bound i)
        (upper-bound i))
     2))
(define (make-center-percent center percentage)
  (make-interval (* center (+ 100 percentage) 0.01)
                 (* center (- 100 percentage) 0.01)))
(define (percent i)
  (* (/ (- (upper-bound i)
           (lower-bound i))
        2.0
        (center i))
     100))
(define (show-center-percent i)
  (display i)
  (newline)
  (display "center: ")
  (display (center i))
  (newline)
  (display "percentage: ")
  (display (percent i))
  (newline))


(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))

(define A (make-center-percent 100 10))
(define B (make-center-percent 100 10))
(show-center-percent (par1 A B))
(show-center-percent (par2 A B))

(define (par r1 r2)
  (/ (* r1 r2)
     (+ r1 r2)))
(par 90 110)

;ex2.15 par2 is better, par1 gives the wrong answer

;ex2.16 par1变量多次出现，分子分母分别做了一次make-interval，导致整个计算过程中r1 r2不是统一值。
;思路：想要实现无歧义计算，需要提前判断简化表达式。