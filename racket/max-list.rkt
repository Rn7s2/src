#lang racket

(define (max-list-bad x)
  (cond [(= (length x) 1) (car x)]
        [else (max (car x) (max-list-bad (cdr x)))]))

(define (max-list x)
  (define (max-list-helper x ret)
    (cond [(= (length x) 0) ret]
          [else (max-list-helper (cdr x) (max ret (car x)))]))
  (max-list-helper x -2147483645))

(define (max-list-loop x)
  (define ret -2147483647)
  (for ([i (in-range (length x))])
    (when (> (list-ref x i) ret)
      (set! ret (list-ref x i))))
  ret)

(define x (make-list 100000 (random 1 4294967087)))
(displayln "bad one:")
(time (max-list-bad x))
(newline)

(displayln "good one:")
(time (max-list x))
(newline)

(displayln "loop one:")
(time (max-list-loop x))
