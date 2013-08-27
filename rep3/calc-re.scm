(use util.queue)

(define (calc expression)
  (let* ((postfix (in2post expression))
        (result (eval-post postfix)))
    (print "infix = " expression)
    (print "postfix = " postfix)
    (print "ans. = " result)))

(define (in2post expression)
  (let process-expression
      ((stack '())
       (queue (make-queue))
       (e expression))
    (let ((token (if (null? e) '() (car e)))
          (rest (if (null? e) '() (cdr e))))
      ;; (print "token = " token
      ;;        " queue = " (queue->list queue)
      ;;        " stack = " stack)
      (cond
       ((null? token)
        (populate! stack queue)
        (queue->list queue))

       ((number? token)
        (enqueue! queue token)
        (process-expression stack queue rest))

       ((null? stack)
        (push! stack token)
        (process-expression stack queue rest))

       ((> (prio token) (prio (top stack)))
        (push! stack token)
        (process-expression stack queue rest))

       (else
        (enqueue! queue (pop! stack))
        (process-expression stack queue e))))))

(define (populate! stack queue)
  (if (not (null? stack))
      (begin
        (enqueue! queue (pop! stack))
        (populate! stack queue))))

(define (prio operator)
  (cdr (assoc operator
              '((+ . 1)
                (- . 1)
                (* . 2)
                (/ . 2)
                (** . 3)))))

(define (top stack)
  (car stack))

(define ** expt)

(define (eval-post postfix-expression)
  (let process-expression
      ((queue (list->queue postfix-expression))
       (stack '()))
    (let ((token (if (queue-empty? queue)
                     '()
                     (dequeue! queue))))
      (cond
       ((null? token)
        (pop! stack))

       ((number? token)
        (push! stack token)
        (process-expression queue stack))

       (else
        (let ((left-operand (pop! stack))
              (right-operand (pop! stack)))
          (push! stack ((eval token '())  right-operand left-operand))
          (process-expression queue stack)))))))


(calc '(3 + 2 * 4 - 6 / 2))

