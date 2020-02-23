#lang racket

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Iteration: functions of one variable
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://docs.racket-lang.org/guide/Lists__Iteration__and_Recursion.html#%28part._tail-recursion%29


(define (iterate f n a)
  (if (= n 0)
      a
      (iterate f (- n 1) (f a))
      )
  )

(define (inc x) (+ x 1))
(define (double x) (* 2 x))

(define (crazy n)
  (if (= 0 (remainder n 2))
      (quotient n 2)
      (+ 1 (* 3 n))))

(define (f n a) (iterate crazy n a))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Examples
;;
;; (iterate inc 5 0) --> 5
;; (iterate double 3 1) --> 8
;; (crazy 4)
;; (crazy 5)
;; (f 5 33)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
