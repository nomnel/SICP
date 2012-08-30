;; 全てコピペ

;a
(define wave
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
	(make-segment (make-vect 0.154 0.605) (make-vect 0.000 0.857))
	(make-segment (make-vect 0.428 0.828) (make-vect 0.471 0.840));左目 追加
	(make-segment (make-vect 0.528 0.840) (make-vect 0.571 0.828));右目 追加
	))

;b
(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1)))
            (corner (corner-split painter (- n 1))))
          (beside (below painter up)
                  (below right corner)))))

;c
(define (corner-split painter n)
  (if (= n 0)
      (flip-horiz painter)
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))
