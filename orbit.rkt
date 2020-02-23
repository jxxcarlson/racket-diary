#lang racket

;;;;;;;;;;;;;;;;;;
;; Orbits
;;;;;;;;;;;;;;;;;;

;; Compute orbit of n steps
(define (orbit f n a) (orbit-aux f n (list a)))

(define (orbit-aux f n a)
  (if (= n 0)
      a
      (orbit-aux f (- n 1) (cons (f (car a)) a))
   ))

;; Example
;; > (orbit double 4 1)
;; '(16 8 4 2 1)
;; (orbit crazy 30 33)
;; What is it?


;; Compute orbit, stopping when a predicate is satisfied
(define (orbit-until f predicate a) (orbit-until-aux f predicate (list a)))

(define (orbit-until-aux f predicate a)
  (if (predicate a)
   a
  (orbit-until-aux f predicate (cons (f (car a)) a))
   ))

;; Example

(define (head-is-one x) (= (car x) 1))

(define (crazy n)
  (if (= 0 (remainder n 2))
      (quotient n 2)
      (+ 1 (* 3 n))))

(reverse (orbit-until crazy head-is-one 33))

(define (test n) (reverse (orbit-until crazy head-is-one n)))

(define (test-length n) (length (test n)))

(define (test-range a b) (map test (range a b)))


