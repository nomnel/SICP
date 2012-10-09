(define W1 (make-withdraw 100))
; E2(balance:100) -> E1(initial-amount:100) -> global-env

(W1 50)
; E3(amount:50) -> E2(balance:50) -> E1(initial-amount:100) -> global-env

(define W2 (make-withdraw 100))
; E5(balance:100) -> E4(initial-amount:100) -> global-env
