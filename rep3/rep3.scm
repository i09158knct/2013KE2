;;
;; 集合演算
;;
(define (empty? a) (null? a))

(define (element? x a)
  (cond ((empty? a ) #f)
        ((equal? x (car a)) #t)
        (else (element? x (cdr a)))))

(define (subset? a b)
  (cond ((empty? a) #t)
        ((element? (car a) b) (subset? (cdr a) b))
        (else  #f)))

(define (cardinal x)
  (cond ((empty? x) 0)
        (else (+ 1 (cardinal (cdr x))))))

(define (union a b)
  (cond ((empty? a) b)
        ((element? (car a) b) (union (cdr a) b))
        (else ;  b に属していない要素を b に含める
         (union (cdr a) (cons (car a) b)))))

(define (union2 a b)
  (cond ((empty? a) b)
        ((element? (car a) b) (union2 (cdr a) b))
        (else ;  b に属していない要素を b に含める
         (cons (car a) (union2 (cdr a) b)))))

(define (intersection a b)
  (cond ((empty? a) '())
        ((element? (car a) b)
         (cons (car a) (intersection (cdr a) b)))
        (else (intersection (cdr a) b))))


;; rep 1
(define (equal-set? a b)
  (and (subset? a b) (subset? b a)))

(define (difference a b)
  (cond ((empty? a) '())
        ((element? (car a) b) (difference (cdr a) b))
        (else (cons (car a) (difference (cdr a) b)))))

(define (proper-subset? a b)
  (and (subset? a b) (not (equal-set? a b))))

(print (equal-set? '(1 2 3 4 5) '(5 4 3 2 1))
       (equal-set? '(1 2 3 4 5) '(1 2 3 4)))

(print (difference '(1 2 3 4 5) '(1 3 5))
       (difference '(1 2 3 4 5) '(1 2 3 4 5 6)))

(print (proper-subset? '(1 2) '(1 2 3))
       (proper-subset? '(1 2 3) '(1 2 3)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 多項式の微分 (p62)
;;
;; (diff '(+ (* 2 x) a) 'x) ==> (+ (+ (* 2 1) (* x 0)) 0)
;; (diff '(** x 4) 'x)      ==> (* 4 (* (** x 3) 1))
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (diff e x)
  (cond ((constant? e) (cond ((eq? e x) 1)  ; (5.1) 式
                             (else 0)))     ; (5.2) 式
        ((eq? (car e) '+)                   ; (5.3) 式
         (list '+
               (diff (cadr e) x)
               (diff (caddr e) x)))
        ((eq? (car e) '-)                   ; (5.4) 式
         (list '-
               (diff (cadr e) x)
               (diff (caddr e) x)))
        ((eq? (car e) '*)                   ; (5.5) 式
         (list '+
               (list '*
                     (cadr e)
                     (diff (caddr e) x))
               (list '*
                     (caddr e)
                     (diff (cadr e) x))))
        ((eq? (car e) '/)                   ; rep 2
         (list '/
               (list '-
                     (list '*
                           (caddr e)
                           (diff (cadr e) x))
                     (list '*
                           (cadr e)
                           (diff (caddr e) x)))
               (list '**
                     (caddr e)
                     2)))
        ((eq? (car e) '**)                  ; (5.6) 式
         (list '*
               (caddr e)
               (list '*
                     (list '**
                           (cadr e)
                           (- (caddr e) 1))
                     (diff (cadr e) x))))))
;;
;; (constant? 'x)       ==> #t
;; (constant? '(+ x 1)) ==> #f
;;
(define (constant? exp)
  (if (member exp '(+ - * / **))
      #f
      (not (pair? exp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 多項式の簡単化 (p62)
;;
;; (simple-plus 0 'z) ==> z
;; (simple-plus 'y 0) ==> y
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (simple-plus p q)
  (cond ((eqv? p 0) q)         ; (5.7) 式
        ((eqv? q 0) p)
        (else (list '+ p q))))
;;
;; (simple-multi 0 'z) ==> 0
;; (simple-multi 'y 1) ==> y
;;
(define (simple-multi p q)
  (cond ((eqv? p 0) 0)         ; (5.8) 式
        ((eqv? q 0) 0)
        ((eqv? p 1) q)         ; (5.9) 式
        ((eqv? q 1) p)
        (else (list '* p q))))

;; rep 3
(define (simple-divide p q)
  (cond ((eqv? p 0) 0)
        ((eqv? q 1) p)
        (else (list '/ p q))))

(define (simple-minus p q)
  (cond ((eqv? p q) 0)
        ((eqv? q 0) p)
        (else (list '- p q))))

(define (simple-power p q)
  (cond ((eqv? q 0) 1)
        ((eqv? q 1) p)
        (else (list '** p q))))

;;
;; (simple '(+ (+ (+ x 0) 0) y))       ==> (+ x y)
;; (simple '(+ (+ (* 2 1) (* x 0)) 0)) ==> 2
;;
(define (simple e)
  (cond ((constant? e) e)
        ((eq? '+ (car e))
         (simple-plus (simple (cadr e))
                      (simple (caddr e))))
        ((eq? '* (car e))
         (simple-multi (simple (cadr e))
                       (simple (caddr e))))
        ((eq? '/ (car e))
         (simple-divide (simple (cadr e))
                        (simple (caddr e))))
        ((eq? '- (car e))
         (simple-minus (simple (cadr e))
                       (simple (caddr e))))
        ((eq? '** (car e))
         (simple-power (simple (cadr e))
                       (simple (caddr e))))
        (else e)))

;;
;; (in2pr '((x ** 2) + (sin (x + 1)))) -> (+ (** x 2) (sin (+ x 1)))
;;
(define (in2pr exp)
  (cond ((constant? exp) exp)  ; 変数か定数のとき
        ((unary? exp) (list (car exp) (in2pr (cadr exp)))) ; 単項演算のとき
        (else (list (cadr exp) ; 2項演算のとき
                    (in2pr (car exp))
                    (in2pr (caddr exp))))))
;;
;; (unary? '(sin x)) -> #t
;; (unary? '(a + b)) -> #f
;;
(define (unary? e) ; 単項演算かどうか調べる述語
  (if (pair? e) (= (length e) 2) #f))

;; rep 4
(define (pr2in exp)
  (cond ((constant? exp) exp)
        ((unary? exp) (list (car exp) (pr2in (cadr exp))))
        (else (list (pr2in (cadr exp))
                    (car exp)
                    (pr2in (caddr exp))))))

(define (mydiff infix-exp x)
  (pr2in (simple (diff (in2pr infix-exp) x))))

; For Gauche
(define ** expt)

(print (diff '(/ 1 x) 'x))
(print (simple '(- (/ a (- 2 (** x 0))) (/ (- x (** x 1)) b))))
(print (mydiff '(1 / x) 'x))
