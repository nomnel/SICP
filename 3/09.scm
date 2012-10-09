(factorial 6)
; 再帰版
; E1 n:6
; E2 n:5
; ...
; E6 n:1

; 反復版
; E1 n:6
; E2 product:1, counter:1, max-count:6
; E3 product:1, counter:2, max-count:6
; ...
; E8 product:720, counter:7, max-count:6

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))
