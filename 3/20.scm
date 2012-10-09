(define x (cons 1 2))
; E1(x:1, y:2, set-x!, set-y! dispatch) -> global(x:E1-dispatch)

(define z (cons x x))
; E2(x:global-x, y:global-x, set-x!, set-y!, dispatch) -> global(z:E2-dispatch)

(set-car! (cdr z) 17)
; E3(z:global-z) -> global
; E4(z:global-x, new-value: 17) -> global

(car x)
; -> 17


(define (cons x y)
  (define (set-x! v) (set! x v))
  (define (set-y! v) (set! y v))
  (define (dispatch m)
    (cond ((eq? m 'car) x)
          ((eq? m 'cdr) y)
          ((eq? m 'set-car!) set-x!)
          ((eq? m 'set-cdr!) set-y!)
          (else (error "Undefined operation -- CONS" m))))
  dispatch)

(define (car z) (z 'car))

(define (cdr z) (z 'cdr))

(define (set-car! z new-value)
  ((z 'set-car!) new-value)
  z)

(define (set-cdr! z new-value)
  ((z 'set-cdr!) new-value)
  z)
