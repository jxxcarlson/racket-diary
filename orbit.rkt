#lang racket

;;;;;;;;;;;;;;;;;;
;; Orbits
;;;;;;;;;;;;;;;;;;

;; Compute orbit of n steps
(define (orbit f n a) (orbit-aux f n (list a)))

(define (orbit-aux f n a)
  (cond
   [(= n 0) a]
   [else (orbit-aux f (- n 1) (cons (f (car a)) a))]
   ))

;; Example
;; > (orbit double 4 1)
;; '(16 8 4 2 1)
;; (orbit crazy 30 33)
;; What is it?


;; Compute orbit, stopping when a predicate is satisfied
(define (orbit-predicate f n a) (orbit-predicate-aux f n (list a)))

(define (orbit-predicate-aux f predicate a)
  (cond
   [(predicate a) a]
   [else (orbit-predicate-aux f predicate (cons (f (car a)) a))]
   ))

;; Example

(define (isOne x) (= (car x) 1))

(define (crazy n)
  (if (= 0 (remainder n 2))
      (quotient n 2)
      (+ 1 (* 3 n))))

(reverse (orbit-predicate crazy isOne 33))
