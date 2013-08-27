;;; 電卓プログラム

;;  以下のリスト中の _____ (９個所）を埋めて，プログラムを完成せよ。

;; 計算式を演算子の優先順位を考慮して計算する
;;       使用できる演算子は、+, -, *, /, **（べき乗）のみ
;;       変数は使用できません。
;;
;; 実行例
;;  > (calc '(3 + 2 * 4 - 6 / 2))
;;  (INFIX = (3 + 2 * 4 - 6 / 2))
;;  (POSTFIX = (3 2 4 * + 6 2 / -))
;;  (ANS. = 8)
;;
(define (calc e) ; 中置記法の式eを計算する手続き
  (set! *stack* '())   ; スタック、キューの初期化
  (set! *queue* '())
  (set! *last* '())
  (write (list 'infix '= e))
  (newline)
  (write (list 'postfix '= (in2post e))) ; eを後置記法に変換(結果はキューに)
  (newline)
  (write (list 'ans. '= (comp))) ; キュー内の式を計算
  (newline))
;;
;; 中置記法の式eを後置(逆ポーランド)記法に変換する手続き
;;
;; (in2post '(3 + 2 * 4 - 6 / 2)) --> (3 2 4 * + 6 2 / -)
;; (in2post '(3 - 2)) --> (3 2 -)
;;
(define (in2post e)
  (cond ((null? e) (set! token '())) ; 処理するトークンがない
        (else (set! token (car e))))
  ;; コメントを外すと処理過程が表示されます
  ;;   (write (list 'token '= token 'queue '= *queue* 'stack '= *stack*)) (newline)
  (cond ((null? token) (popall) *queue*) ; すべてのトークンを処理し終わる
        ((number? token)         ; トークンが数字なら
         (enqueue token) (in2post (cdr e)))
        ((null? *stack*)         ; 演算子でスタックが空なら
         (push token)
         (in2post (cdr e)))
        ((> (prio token) (prio (top))) ; 演算子の優先順位が高い
         (push token)
         (in2post (cdr e)))
        (else                          ; 優先順位が低い
         (enqueue (pop)) (in2post e))
        ))

(define (popall) ; スタックの内容を全部取り出し、キューに入れる手続き
  (cond ((null? *stack*) #t)
        (else (enqueue (pop)) (popall))))

(define (prio x)   ; 演算子の優先順位を返す手続き
  (cdr (assoc x
              '((+ . 1)
                (- . 1)
                (* . 2)
                (/ . 2)
                (** . 3)))))
;;
;; 逆ポーランド記法の式を計算する手続き
;;
(define (comp)
  (cond ((null? *queue*) (set! token '())) ; 処理するトークンがない
        (else (set! token (dequeue))))     ; キューからトークンを取り出す
  ;; コメントを外すと処理過程が表示されます
  ;;   (write (list 'token '= token 'queue '= *queue* 'stack '= *stack*)) (newline)
  (cond ((null? token) (pop))   ; 全てのトークンを処理し終えたら答えを返す
        ((number? token)        ; トークンが数値なら
         (push token)           ;    スタックに積む
         (comp))                ;    残りの式を再帰的に計算
        (else                   ; トークンが演算子のとき
         (set! arg2 (pop))      ;    スタックトップを取り出し第２引数にセット
         (set! arg1 (pop))      ;    スタックトップを取り出し第１引数にセット
         ;; コメントを外すと処理過程が表示されます
         ;;          (write (list 'calc arg1 token arg2))(newline)
         (push (eval (list token arg1 arg2))) ; 計算し、結果をスタックに積む
         (comp))))              ;    残りの式を再帰的に計算

(define (** x y)  ; べき乗の計算をする手続き
  (expt x y))

;;;    スタック操作手続き   教科書(pp.39-40)

(define *stack* '())  ; スタックの初期化

(define (push data)  ; スタックのトップにdataを積む
  (if (null? *stack*) (set! *stack* (list data))
      (set! *stack* (cons data *stack*)))
  *stack*)

(define (pop)  ; スタックトップのデータを取り出し返す
  (cond ((null? *stack*) 'empty)
        (else ((lambda (x) (set! x (car *stack*))
                       (set! *stack* (cdr *stack*))
                       x) '()))))

(define (top)  ; スタックトップのデータを返す(スタックに変化無し)
  (if (null? *stack*) 'empty
      (car *stack*)))

;;;    キュー操作手続き  教科書(pp.40-41)

(define *queue* '())  ; キューの初期化
(define *last* '())   ; キューの最後の要素を指す変数の初期化

(define (enqueue data)  ; キューの最後にdataを入れる
  (cond ((null? *queue*)
         (set! *queue* (list data)) (set! *last* *queue*))
        (else (set-cdr! *last* (list data))
              (set! *last* (cdr *last*))))
  *queue*)

(define (dequeue)  ; キューから先頭の要素を取り出し返す
  (cond ((null? *queue*) 'empty)
        (else ((lambda (x) (set! x (car *queue*))
                       (set! *queue* (cdr *queue*))
                       x)  '()))))
;;;    作業変数

(define token '()) ; トークン
(define arg1 '())  ; 第１引数
(define arg2 '())  ; 第２引数

;; For Gauche
(define write display)
(define eval (let* ((eval-original eval)) (lambda (e) (eval-original e '()))))

(calc '(3 + 2 * 4 - 6 / 2))
