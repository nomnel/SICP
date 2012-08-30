(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define outline-painter
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 0 1))
	 (make-segment (make-vect 0 1) (make-vect 1 1))
	 (make-segment (make-vect 1 1) (make-vect 1 0))
	 (make-segment (make-vect 1 0) (make-vect 0 0)))))

(define X-painter
  (segments->painter
   (list (make-segment (make-vect 0 0) (make-vect 1 1))
	 (make-segment (make-vect 1 0) (make-vect 0 1)))))

(define diamond-pointer
  (segments->painter
   (list (make-segment (make-vect 0.5 0) (make-vect 0 0.5))
	 (make-segment (make-vect 0 0.5) (make-vect 0.5 1))
	 (make-segment (make-vect 0.5 1) (make-vect 1 0.5))
	 (make-segment (make-vect 1 0.5) (make-vect 0.5 0)))))

;; コピペ
;; わかるわけない
(define wave-painter
  (segments->painter
    (list (make-segment (make-vect 0.000 0.645) (make-vect 0.154 0.411))
          (make-segment (make-vect 0.154 0.411) (make-vect 0.302 0.588))
          (make-segment (make-vect 0.302 0.588) (make-vect 0.354 0.497))
          (make-segment (make-vect 0.354 0.497) (make-vect 0.245 0.000))
          (make-segment (make-vect 0.419 0.000) (make-vect 0.497 0.171))
          (make-segment (make-vect 0.497 0.171) (make-vect 0.575 0.000))
          (make-segment (make-vect 0.748 0.000) (make-vect 0.605 0.462))
          (make-segment (make-vect 0.605 0.462) (make-vect 1.000 0.142))
          (make-segment (make-vect 1.000 0.354) (make-vect 0.748 0.657))
          (make-segment (make-vect 0.748 0.657) (make-vect 0.582 0.657))
          (make-segment (make-vect 0.582 0.657) (make-vect 0.640 0.857))
          (make-segment (make-vect 0.640 0.857) (make-vect 0.575 1.000))
          (make-segment (make-vect 0.419 1.000) (make-vect 0.354 0.857))
          (make-segment (make-vect 0.354 0.857) (make-vect 0.411 0.657))
          (make-segment (make-vect 0.411 0.657) (make-vect 0.285 0.657))
          (make-segment (make-vect 0.285 0.657) (make-vect 0.154 0.605))
          (make-segment (make-vect 0.154 0.605) (make-vect 0.000 0.857)))))
