(define acc (make-account 50))
; E1(balance:50, withdraw, deposit, dispatch) -> global(acc:E1-dispatch)

((acc 'deposit) 40)
; E2(m:'deposit) -> E1
; E3(amount:40) -> E1

((acc 'withdraw) 60)
; E4(m:'withdraw) -> E1
; E5(amount:60) -> E1

; accの局所状態 = E1

(define acc2 (make-account 100))
; E6(balance:100, withdraw, deposit, dispatch) -> global(acc:E6-dispatch)

; accとacc2の局所状態: 環境を分ける(E1, E6)ことで別々に保たれている
; accとacc2で共有する環境構造: 大域環境?


(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)
