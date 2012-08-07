(define (f g)
  (g 2))

;; 下のように解釈されエラーとなる
;; (f f)
;; -> (f (lambda (x) (x 2)))
;; -> ((lambda (x) (x 2)) 2)
;; -> (2 2)
