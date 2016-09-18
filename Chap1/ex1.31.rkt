(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result)))) ;老毛病(term a)
  (iter a 1))

(define (inc a) (+ a 1))
(define (p-term a)
  (define x (+ (* 2 a) 1))
  (/ (* (- x 1) (+ x 1)) (* x x)))
(define (pi-product b)
  (define a 1)
  (* 4.0 (product-iter p-term a inc b)))
(pi-product 1000)


  