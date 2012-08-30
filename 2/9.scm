(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

;; (width (+ x y))
;; = (/ (- (upper-bound (+ x y)) (lower-bound (+ x y))) 2)
;; = (/ (- (+ (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y))) 2)
;; = (+ ((- (upper-bound x) (lower-bound x)) 2) ((- (upper-bound y) (lower-bound y)) 2))
;; = (+ (width x) (width y))

;; (width (- x y))
;; = (/ (- (upper-bound (- x y)) (lower-bound (- x y))) 2)
;; = (/ (- (- (upper-bound x) (lower-bound y)) (- (lower-bound x) (upper-bound y))) 2)
;; = (+ (/ (- (upper-bound x) (lower-bound x)) 2) (/ (- (upper-bound y) (lower-bound y)) 2))
;; = (+ (width x) (width y))
