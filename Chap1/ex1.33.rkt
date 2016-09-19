#lang planet neil/sicp
(define (square x) (* x x))
(define (divides? a b)
  (= (remainder b a) 0))
(define (smallest-divisor n)
  (define (find-divisor n test)
    (cond ((> (square test) n) n)
          ((divides? test n) test)
          (else (find-divisor n (+ test 1)))))
  (find-divisor n 2))
(define (prime? n)
  (and (> n 1) (= n (smallest-divisor n)))) ;1不是质数
  

(define (filtered-accumulate combiner null-value term a next b filter?)
  (if (> a b)
      null-value
      (combiner (if (filter? a) (term a) null-value)
                (filtered-accumulate combiner null-value term (next a) next b filter?))))
; a
(define (inc a) (+ a 1))
(define (prime-square-sum a b)
  (filtered-accumulate + 0 square a inc b prime?))

(prime-square-sum 1 7)
; b
(define (gcd m n)
  (if (= n 0)
      m
      (gcd n (remainder m n))))
      
(define (rp-product n)
  (define (relative-prime? i)
    (and (< i n) (= (gcd i n) 1)))
  (filtered-accumulate * 1 identity 1 inc n relative-prime?))

(rp-product 10)
  

