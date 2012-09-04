; a
(define (get-record personnel-file employee-name)
  ((get 'get-record (division personnel-file))
   (records personnel-file) employee-name))
; divisionで事業所タイプが取得できる必要がある -> 全事業所共通の方法で事業所型が追加されるべき
; 実装例(事業所ごとの従業員ファイルの先頭に事業所型があるとした)
; (define (division personnel-file) (car personnel-file))
; (define (records personnel-file) (cdr personnel-file))


; b
(define (get-salary employee-record)
  ((get 'get-salary (division employee-record)) employee-record))
; 各従業員のレコードから事業所を特定する必要がある
; 実装例(従業員レコードの先頭に事業所型があるとした)
; (define (division employee-record) (car employee-record))


; c
(define (find-employee-record employee-name divisions-files)
  (if (null? divisions-files) #f
      (let ((found (get-record (car divisions-files) employee-name)))
	(if found found
	    (find-employee-record (cdr divisions-files) employee-name)))))

; d
; 合併した会社が管理していた従業員情報システムに
; 従業員ファイルから従業員レコードを得る get-record と
; 従業員レコードから情報を得る get-salary, get-address など必要なものを実装し
; パッケージを作成して表にputすればよい
