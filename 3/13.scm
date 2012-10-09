(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

; z: a -> b -> c -> a(最初に戻る。循環リストになっている)

(last-pair z)
; 無限ループ
