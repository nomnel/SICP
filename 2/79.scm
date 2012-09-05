(define (equ? x y)
  (apply-generic 'equ? x y))

; それぞれのパッケージに以下を追加

; @install-scheme-number-package
(define (equ?-num x y)
  (= x y))

(put 'equ? '(scheme-number scheme-number)
     (lambda (x y) (equ?-num x y)))

; @install-rational-package
(define (equ?-rat x y)
  (or (and (= (numer x) (numer y)) (= (denom x) (denom y)))
      (and (= (numer x) (- (numer y))) (= (denom x) (- (denom y))))))

(put 'equ? '(rational rational)
     (lambda (x y) (equ?-rat x y)))

; @install-complex-package
(define (equ?-complex z1 z2)
  (and (= (real-part z1) (real-part z2))
       (= (imag-part z1) (imag-part z2))))

(put 'equ? '(complex complex)
     (lambda (z1 z2) (equ?-complex z1 z2)))
