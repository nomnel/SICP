(define (flip-horiz painter)
  (trasform-painter painter
		    (make-vect 1.0 0.0)
		    (make-vect 0.0 0.0)
		    (make-vect 1.0 1.0)))

(define (rotate180 painter)
  (trasform-painter painter
		    (make-vect 1.0 1.0)
		    (make-vect 0.0 1.0)
		    (make-vect 1.0 0.0)))

(define (rotate270 painter)
  (trasform-painter painter
		    (make-vect 0.0 1.0)
		    (make-vect 0.0 0.0)
		    (make-vect 1.0 1.0)))
