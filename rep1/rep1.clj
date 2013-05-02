;;
;; ex1
;;
(defn ex1-1 [length height] (/ (* length height) 2))
(println "ex1-1:" (ex1-1 5 2.5))


(defn ex1-2 [radius] (* radius radius (. Math PI)))
(println "ex1-2:" (ex1-2 3))


(defn ex1-3 [radius] (* (/ 4 3) radius radius radius (. Math PI)))
(println "ex1-3:" (ex1-3 3))


(defn ex1-4 [a b c]
  (let [s (/ (+ a b c) 2)]
    (. Math sqrt (* s (- s a) (- s b) (- s c)))))

(println "ex1-4:" (ex1-4 3 4 5))



;;
;; ex2
;;
(defn ex2-1 [n]
  (cond
    (>= n 80) "優"
    (>= n 60) "良"
    (>= n 50) "可"
    :else "不可"))

(println "ex2-1:" (ex2-1 80))
(println "ex2-1:" (ex2-1 49))


(defn ex2-2 [a b c]
  (let [d (- (* b b) (* 4 a c))]
    (cond
      (> d 0) 2
      (= d 0) 1
      :else 0)))

(println "ex2-2:" (ex2-2 1 2 1))
(println "ex2-2:" (ex2-2 1 1 1))
(println "ex2-2:" (ex2-2 2 1 -1))


(defn ex2-3 [year]
  (let [multiple-of? #(zero? (mod year %1))]
    (and (multiple-of? 4)
         (or (not (multiple-of? 100))
             (multiple-of? 400)))))

(println "ex2-3:" (ex2-3 1996))
(println "ex2-3:" (ex2-3 2000))
(println "ex2-3:" (ex2-3 2100))


(defn ex2-4 [])

(println "ex2-4:" (ex2-4))



;;
;; ex3
;;
(defn ex3-1 [n]
  (loop [n n acc 1]
  (if (<= n 1)
    acc
    (recur (dec n) (* acc n)))))

(println "ex3-1:" (ex3-1 5))


(defn ex3-2 [x y]
  (. Math pow x y))

(println "ex3-2:" (ex3-2 2 3))


(defn ex3-3 [n]
  (apply + (range (inc n))))

(println "ex3-3:" (ex3-3 10))


(defn ex3-4 [a b]
  (if (zero? b)
    a
    (recur b (mod a b))))

(println "ex3-4:" (ex3-4 30 12))



;;
;; ex4
;;
(defn ex4-1 [])

(println "ex4-1:" (ex4-1))


(defn ex4-2 [])

(println "ex4-2:" (ex4-2))


(defn ex4-3 [])

(println "ex4-3:" (ex4-3))


(defn ex4-4-1 [])

(println "ex4-4-1:" (ex4-4-1))


(defn ex4-4-2 [])

(println "ex4-4-2:" (ex4-4-2))


(defn ex4-5 [])

(println "ex4-5:" (ex4-5))



;;
;; ex5
;;
(defn ex5-1 [])

(println "ex5-1:" (ex5-1))


(defn ex5-2 [])

(println "ex5-2:" (ex5-2))


(defn ex5-3 [])

(println "ex5-3:" (ex5-3))


