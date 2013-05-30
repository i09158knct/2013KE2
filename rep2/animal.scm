(define *init-base*
  '("背骨があるか"
    ("温血動物か"
     ("こどもを母乳で育てるか"
      ("水中に住んでいるか"
       "いるか"
       ("一般に飼い慣らされているか"
        "いぬ"
        "とら"))
      ("飛べるか"
       "こまどり"
       "にわとり"))
     ("えらを持っていて、一生水中で生活するか"
      "まぐろ"
      ("最初はえらで、そのうち肺呼吸をするようになるか"
       "かえる"
       ("足があるか"
        "わに"
        "へび"))))
    ("飛べるか"
     "か"
     "みみず")))

(define (yes-or-no? prompt)
  (display prompt) (display " (y/n)? ") (flush)
  (eq? (read) 'y))

(define (animal tree)
  (if (list? tree)
      (if (yes-or-no? (car tree))
          (animal (cadr tree))
          (animal (caddr tree)))
      (begin (print tree) tree)))


(define (start)
  (newline) (display "### アニマル プログラム ###")
  (newline) (newline)
  (animal *init-base*))

(start)
