(define (random-in-range low high)
  (use srfi-27) ; random-integer
  (let ((range (- high low)))
    (+ low (random-integer range))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (let ((test (lambda ()
		(P (random-in-range x2 x1)
		   (random-in-range y2 y1))))
	(area (* (- x1 x2) (- y1 y2))))
    (* area (monte-carlo trials test))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

; 単位円の面積を測定することによる、πの見積り
(estimate-integral
 (lambda (x y) (>= 1 (+ (expt x 2) (expt y 2))))
 1 -1 1 -1 1000000) ; -> 46899/15625 (/. 46899 15625) -> 3.001536
