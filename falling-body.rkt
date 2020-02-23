#lang racket
(require 2htdp/image)
(require 2htdp/universe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic image drawing
;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (place-circle x y image)
  (place-image (circle 5 "solid" "green")
               x y image))

(define CANVAS (empty-scene 300 800))

(define (fc t image)
  (place-circle (* 3 t) (* 0.1 t t) image))

(define (falling-body t) (fc t CANVAS))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Examples
;; (fc 20 CANVAS)
;; (fc 30 (fc 20 (fc 10 (fc 1 CANVAS))))
;; (animate falling-body)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
