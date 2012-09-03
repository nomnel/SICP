(add-load-path "." :relative)
(load "68.scm")
(load "69.scm")

(define eight-symbols '((a 2) (na 16) (boom 1) (sha 3) (get 2) (yip 9) (job 2) (wah 1)))
(generate-huffman-tree eight-symbols)
; -> ((leaf na 16) ((leaf yip 9) ((((leaf wah 1) (leaf boom 1) (wah boom) 2) (leaf job 2) (wah boom job) 4) ((leaf sha 3) ((leaf get 2) (leaf a 2) #0=(get a) 4) #1=(sha . #0#) 7) #2=(wah boom job . #1#) 11) #3=(yip . #2#) 20) (na . #3#) 36)

(define lyrics '(get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom))

(encode lyrics (generate-huffman-tree eight-symbols))
; -> (1 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 0 1 1 1 1 1 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 0 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 0 1)
; (length (encode lyrics (generate-huffman-tree eight-symbols))) -> 84
; (length lyrics) -> 36
; 符号化に84ビット必要で, 固定長符号だと最小で, 36 * 3 = 108ビット必要
