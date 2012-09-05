(define (=zero? x)
  (apply-generic '=zero? x))

; それぞれのパッケージに以下を追加

; @install-scheme-number-package
(define (=zero?-num x)
  (= x 0))

(put 'zero? '(scheme-number)
     (lambda (x) (zero?-num x)))

; @install-rational-package
(define (zero?-rat x)
  (= (numer x) 0))

(put 'zero? '(rational)
     (lambda (x) (zero?-rat x)))

; @install-complex-package
(define (zero?-complex z)
  (and (= (real-part z) 0)
       (= (imag-part z) 0)))

(put 'zero? '(complex)
     (lambda (z) (zero?-complex z)))
