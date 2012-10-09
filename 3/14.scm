(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(define v '(a b c d))
(define w (mystery v))
w ; -> (d c b a)
v ; -> (a)
; 一般にmysteryは与えられたリストの逆順を返す。
; その際、与えられたリストは最初の項目と空リストの対になる
; (図は面倒なので省略)
