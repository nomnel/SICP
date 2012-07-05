(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; (a-plus-abs-b 3 4) => 7
; (a-plus-abs-b 3 -4) => 7
; 最初にif式が評価され、bが0より大きければ+、0以下なら-が返る
; よってb>0なら(+ a b)、それ以外なら(- a b)が評価される