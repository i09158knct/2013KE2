;;;
;;; ex1
;;;

;; ex1-1
(define (ex1-1 a h)
  (/ (* a h) 2))

(print "ex1-1: " (ex1-1 5 2.5))


;; ex1-2
(define (ex1-2 r)
  (* r r 3.14))

(print "ex1-2: " (ex1-2 3))


;; ex1-3
(define (ex1-3 r)
  (* (/ 4 3) r r r 3.14))

(print "ex1-3: " (ex1-3 3))


;; ex1-4
(define (ex1-4 a b c)
  (let ((s (/ (+ a b c) 2)))
    (sqrt (* s (- s a) (- s b) (- s c)))))

(print "ex1-4: " (ex1-4 3 4 5))



;;;
;;; ex2
;;;

;; ex2-1
(define (ex2-1 n)
  (cond
    ((> n 80) :優)
    ((> n 60) :良)
    ((> n 50) :可)
    (#t :不可)))

(print "ex2-1: " (ex2-1 81))
(print "ex2-1: " (ex2-1 20))


;; ex2-2
(define (ex2-2 a b c)
  (let ((d (- (* b b) (* 4 a c))))
    (cond
      ((> d 0) 2)
      ((= d 0) 1)
      (#t 0))))

(print "ex2-2: " (ex2-2 1 2 1))
(print "ex2-2: " (ex2-2 1 1 1))
(print "ex2-2: " (ex2-2 2 1 -1))


;; ex2-3
(define (ex2-3 y)
  (let ((multiple-of? (lambda (n) (zero? (modulo y n)))))
    (and (multiple-of? 4)
         (or (not (multiple-of? 100))
             (multiple-of? 400)))))

(print "ex2-3: " (ex2-3 1996))
(print "ex2-3: " (ex2-3 2000))
(print "ex2-3: " (ex2-3 2100))


;; ex2-4
(define (ex2-4 a b c)
  (let ((x1 (/ (+ (- b) (sqrt (- (* b b) (* 4 a c))))
               (* 2 a)))
        (x2 (/ (- (- b) (sqrt (- (* b b) (* 4 a c))))
               (* 2 a))))
    (list x1 x2)))

(print "ex2-4: " (ex2-4 1 2 1))
(print "ex2-4: " (ex2-4 1 1 1))
(print "ex2-4: " (ex2-4 2 1 -1))



;;;
;;; ex3
;;;

;; ex3-1
(define (ex3-1 n)
  (do ((i 1 (+ i 1))
       (acc 1 (* acc i)))
      ((> i n) acc)))

(print "ex3-1: " (ex3-1 5))


;; ex3-2
(define (ex3-2 x y)
  (do ((i 1 (+ i 1))
       (acc 1 (* acc x)))
      ((> i y) acc)))

(print "ex3-2: " (ex3-2 2 3))


;; ex3-3
(define (ex3-3 n)
  (do ((i 1 (+ i 1))
       (acc 0 (+ acc i)))
      ((> i n) acc)))

(print "ex3-3: " (ex3-3 10))


;; ex3-4
(define (ex3-4 a b)
  (do ((a a b)
       (b b (modulo a b)))
      ((= b 0) a)))

(print "ex3-4: " (ex3-4 30 12))



;;;
;;; ex4
;;;

;; ex4-1
(define (ex4-1 n)
  (if (= n 0)
    1
    (* n (ex4-1 (- n 1)))))

(print "ex4-1: " (ex4-1 5))


;; ex4-2
(define (ex4-2 x y)
  (if (= y 0)
    1
    (* x (ex4-2 x (- y 1)))))

(print "ex4-2: " (ex4-2 2 3))


;; ex4-3
(define (ex4-3 n)
  (if (= n 1)
    1
    (+ n (ex4-3 (- n 1)))))

(print "ex4-3: " (ex4-3 10))


;; ex4-4
(define (ex4-4 a b)
  (if (= b 0)
    a
    (ex4-4 b (modulo a b))))

(print "ex4-4: " (ex4-4 30 12))


;; ex4-4-1
(define (ex4-4-1 a b c)
  (ex4-4 a (ex4-4 b c)))

(print "ex4-4-1: " (ex4-4-1 12 36 30))


;; ex4-4-2
(define (ex4-4-2 a b)
  (let ((gcd (ex4-4 a b)))
    (* gcd (/ a gcd) (/ b gcd))))

(print "ex4-4-2: " (ex4-4-2 12 30))


;; ex4-5
(define (ex4-5 n)
  (cond
    ((= n 0) 1)
    ((= n 1) 1)
    (#t (+ (ex4-5 (- n 1)) (ex4-5 (- n 2))))))

(print "ex4-5: " (ex4-5 6))



;;;
;;; ex5
;;;

;; ex5-1
(define (ex5-1 n)
  (let factorial ((n n) (acc 1))
    (if (= n 0)
      acc
      (factorial (- n 1) (* acc n)))))

(print "ex5-1: " (ex5-1 5))


;; ex5-2
(define (ex5-2 x y)
  (let power ((n y) (acc 1))
    (if (= n 0)
        acc
        (power (- n 1) (* acc x)))))

(print "ex5-2: " (ex5-2 2 3))


;; ex5-3
(define (ex5-3 n)
  (let factor-sum ((n n) (acc 0))
    (if (= n 0)
        acc
        (factor-sum (- n 1) (+ acc n)))))

(print "ex5-3: " (ex5-3 10))



;;;
;;; lx1
;;;

;; lx1-1
(define (lx1-1 ls)
  (if (null? ls)
      0
      (+ 1 (lx1-1 (cdr ls)))))

(print "lx1-1: " (lx1-1 '((a b) c (d e))))


;; lx1-2
(define (lx1-2 target ls)
  (cond
   ((null? ls) #f)
   ((eq? target (car ls)) #t)
   (#t (lx1-2 target (cdr ls)))))

(print "lx1-2: " (lx1-2 'c '(a b c d e)))


;; lx1-3
(define (lx1-3 ls)
  (if (null? (cdr ls))
      (car ls)
      (lx1-3 (cdr ls))))

(print "lx1-3: " (lx1-3 '(a b c d e)))


;; lx1-4
(define (lx1-4 ls index)
  (if (zero? index)
      (car ls)
      (lx1-4 (cdr ls) (- index 1))))

(print "lx1-4: " (lx1-4 '(a b c d e) 3))


;; lx1-5
(define (lx1-5 target ls)
  (fold (lambda (x acc) (+ acc (if (eq? x target) 1 0)))
        0
        ls))

(define (lx1-5 target ls)
  (length (filter (lambda (x) (eq? x target)) ls)))

(print "lx1-5: " (lx1-5 'x '(a b x (x) d x e)))


;; lx1-6
(define (lx1-6 target ls)
  (fold (lambda (x acc)
          (if (eq? x target)
              acc
              (append acc (list x))))
        '()
        ls))

(define (lx1-6 target ls)
  (filter (lambda (x) (not (eq? x target))) ls))

(print "lx1-6: " (lx1-6 'x '(a b x c (x) d x e)))


;; lx1-7
(define (lx1-7 target new-value ls)
  (map (lambda (x) (if (eq? x target) new-value x))
       ls))

(print "lx1-7: " (lx1-7 'x 'o '(a b x c (x) d x e)))



;;;
;;; lx2
;;;

;; lx2-1
(define (lx2-1 ls)
  (let ((count-for-elem
         (lambda (x)
           (cond
            ((null? x) 0)
            ((list? x) (lx2-1 x))
            (#t 1)))))
    (apply + (map count-for-elem ls))))

(print "lx2-1: " (lx2-1 '((a b) c (d e))))


;; lx2-2
(define (lx2-2 target ls)
  (and (not (null? ls))
       (or (let ((head (car ls)))
             (if (list? head)
                 (lx2-2 target head)
                 (eq? target head)))
           (lx2-2 target (cdr ls)))))

(print "lx2-2: " (lx2-2 'c '(a b (c) d e)))


;; lx2-3
(define (lx2-3 target ls)
  (let ((count-for-elem
         (lambda (x)
           (cond
            ((null? x) 0)
            ((list? x) (lx2-3 target x))
            ((eq? x target) 1)
            (#t 0)))))
    (apply + (map count-for-elem ls))))

(print "lx2-3: " (lx2-3 'x '(a x (x (a (x b (c d x (x)))) e x))))


;; lx2-4
(define (lx2-4 target ls)
  (fold (lambda (x acc)
          (append acc
                  (cond
                   ((list? x) (list (lx2-4 target x)))
                   ((eq? x target) '())
                   (#t (list x)))))
        '()
        ls))

(print "lx2-4: " (lx2-4 'x '(a x (x (a (x b (c d x (x)))) e x))))


;; lx2-5
(define (lx2-5 target new-value ls)
  (map (lambda (x)
         (cond
          ((list? x) (lx2-5 target new-value x))
          ((eq? x target) new-value)
          (#t x)))
       ls))

(print "lx2-5: " (lx2-5 'x 'o '(a x (x (a (x b (c d x (x)))) e x))))


;; lx2-6
(define (lx2-6 ls)
  (fold (lambda (x acc) (append acc (if (list? x) (lx2-6 x) (list x))))
        '()
        ls))

(print "lx2-6: " (lx2-6 '(a x (x (a (x b (c d x (x)))) e x))))
