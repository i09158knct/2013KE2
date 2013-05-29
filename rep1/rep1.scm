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
nnnn        (x2 (/ (- (- b) (sqrt (- (* b b) (* 4 a c))))
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
        (factor-sum (- n 1) (* acc n)))))

(print "ex5-3: " (ex5-3 10))



;;; ### WIP ###
;;; lx1
;;;

;; lx1-1
(define (lx1-1 ls)
  )

(print "lx1-1: " (lx1-1 '((a b) c (d e))))


;; lx1-2
(define (lx1-2 target ls)
  )

(print "lx1-2: " (lx1-2 'c '(a b c d e)))


;; lx1-3
(define (lx1-3)
  )

(print "lx1-3: " (lx1-3 '(a b c d e)))


;; lx1-4
(define (lx1-4)
  )

(print "lx1-4: " (lx1-4 ))


;; lx1-5
(define (lx1-5)
  )

(print "lx1-5: " (lx1-5 ))


;; lx1-6
(define (lx1-6)
  )

(print "lx1-6: " (lx1-6 ))


;; lx1-7
(define (lx1-7)
  )

(print "lx1-7: " (lx1-7 ))




;; lx2-
; (define (lx2-)
;   )

; (print "lx2-: " (lx2- ))



;(exit)
