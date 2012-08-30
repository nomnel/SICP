(add-load-path "." :relative)
(load "2.scm")

(define (make-rectangle side1 side2)
  (cons side1 side2))

(define (side1 rec)
  (car rec))

(define (side2 rec)
  (cdr rec))

(define (segment-length seg)
  (define (diff of)
    (abs (- (of (start-segment seg))
	    (of (end-segment seg)))))
  (sqrt (+ (expt (diff x-point) 2)
	   (expt (diff y-point) 2))))

(define (perimeter rec)
  (* 2 (+ (segment-length (side1 rec))
	  (segment-length (side2 rec)))))

(define (area rec)
  (* (segment-length (side1 rec))
     (segment-length (side2 rec))))
