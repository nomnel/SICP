(define f
  (let ((x #f))
    (lambda (arg)
      (if x x (begin (set! x arg) 0)))))

; Gaucheの評価順は左から?なので
(+ (f 0) (f 1)) ; -> 0
(+ (f 1) (f 0)) ; -> 1
