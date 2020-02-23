#lang racket
(require 2htdp/image)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Iteration: functions of two variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (iterate2 f n step a b)
  (cond
   [(<= n 0) b]
   [else (iterate2 f (- n 1) step (+ step a) (f (+ step a) b))]
   ))


;; Image functions

(define (place-circle x y image)
  (place-image (circle 5 "solid" "green")
               x y image))

(define CANVAS (empty-scene 300 600))

(define (fc t image)
  (place-circle (* 3 t) (* 0.1 t t) image))

;; Example

(iterate2 fc 15 5 0 CANVAS)
