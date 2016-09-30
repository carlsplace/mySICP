(define (make-interval a b) (cons a b))
(define (lower-bound x) (min (car x) (cdr x)))
(define (upper-bound x) (max (car x) (cdr x)))


;http://community.schemewiki.org/?sicp-ex-2.11
 (define (mul-interval x y) 
   ;; endpoint-sign returns: 
   ;;     +1 if both endpoints non-negative, 
   ;;     -1 if both negative, 
   ;;      0 if opposite sign 
   (define (endpoint-sign i) 
     (cond ((and (>= (upper-bound i) 0) 
                 (>= (lower-bound i) 0)) 
            1) 
           ((and (< (upper-bound i) 0) 
                 (< (lower-bound i) 0)) 
            -1) 
           (else 0))) 
  
   (let ((es-x (endpoint-sign x)) 
         (es-y (endpoint-sign y)) 
         (x-up (upper-bound x)) 
         (x-lo (lower-bound x)) 
         (y-up (upper-bound y)) 
         (y-lo (lower-bound y))) 
  
     (cond ((> es-x 0) ;; both x endpoints are +ve or 0 
            (cond ((> es-y 0) 
                   (make-interval (* x-lo y-lo) (* x-up y-up))) 
                  ((< es-y 0) 
                   (make-interval (* x-up y-lo) (* x-lo y-up))) 
                  (else 
                   (make-interval (* x-up y-lo) (* x-up y-up))))) 
  
           ((< es-x 0) ;; both x endpoints are -ve 
            (cond ((> es-y 0) 
                   (make-interval (* x-lo y-up) (* x-up y-lo))) 
                  ((< es-y 0) 
                   (make-interval (* x-up y-up) (* x-lo y-lo))) 
                  (else 
                   (make-interval (* x-lo y-up) (* x-lo y-lo))))) 
  
           (else  ;; x spans 0 
            (cond ((> es-y 0) 
                   (make-interval (* x-lo y-up) (* x-up y-up))) 
                  ((< es-y 0) 
                   (make-interval (* x-up y-lo) (* x-lo y-lo))) 
                  (else 
                   ;; Both x and y span 0 ... need to check values 
                   (make-interval (min (* x-lo y-up) (* x-up y-lo)) 
                                  (max (* x-lo y-lo) (* x-up y-up))))))))) 