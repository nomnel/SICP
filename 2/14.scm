(add-load-path "." :relative)
(use chap2)

;; 以下コピペ
; いろいろ計算し, 誤差を調べてみる. 

(define a (make-center-percent 100 1))
(define b (make-center-percent 200 1))
(percent a) ;==> 1
(percent b) ;==> 1
(define q0 (div-interval a a))
(percent q0) ;==> 1.9999500012499796  ;1%どうしを割って2%の誤差になった. 
(define q1 (div-interval a b))
(percent q1) ;==> 1.9999500012499796  ;同様

; 1を定義して抵抗の計算みたいなことをやってみる. 

(define one (make-center-percent 1 0))

(define p (mul-interval a b))
(define s (add-interval a b))
(percent p) ;==>  80000/40001
(exact->inexact (percent p)) ;==> 1.9999500012499687  ;積の誤差は2%
(percent s) ;==> 1                                    ;和の誤差は1%
(percent (div-interval p s)) ;==> 2.999800014998875   ;並列抵抗の誤差は3%

(define r0 (div-interval one a))
(percent r0) ;==> 1.0000000000000036     ;1/aの誤差は1%
(define r1 (div-interval one b))
(percent r1) ;==> 1.0000000000000036     ;1/bの誤差は1%
(define s0 (add-interval r0 r1))
(percent s0) ;==>  .9999999999999978     ;分母の誤差は1%
(define r (div-interval one s0))
(percent r)  ;==>  .9999999999999858     ;並列抵抗の誤差は1%

; -> 誤差のあるデータが演算に入るたびに誤差が増える傾向にある. 
