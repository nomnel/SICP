(define (make-center-percent c p)
  (let ((w (/ (* c (/ p 100)) 2)))
    (make-interval (- c w) (+ c w))))

(define (percent i)
  (* (/ (- (upper-bound i) (lower-bound i)) (center i)) 100))
