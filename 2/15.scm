(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

;; 以下コピペ

; par1には不確かな変数が4回, par2には2回現れる. 実験してみると
(define r1 (make-center-percent 200 5))
(define r2 (make-center-percent 300 5))

(define p1 (par1 r1 r2)) ;par1で計算した結果をp1
(define p2 (par2 r1 r2)) ;par2で計算した結果をp2とする 正確な並列抵抗は120

p1 ;==> (111.29268292682927 . 129.30769230769232)

p2 ;==> (116.99999999999999 . 123.00000000000001)

(center p1)  ;==> 120.3001876172608

(percent p1) ;==> 14.975046787273868

(center p2)  ;==> 120.

(percent p2) ;==> 5.000000000000024

; ∴ Evaの主張は正しい
