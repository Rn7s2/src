#lang racket

(let* ((n 10000)
       (cnt 0)
       (prime (make-vector n 0))
       (is-prime (make-vector n #t)))

  (define (get-prime)
    (set! cnt 0)
    (vector-set! is-prime 0 #f)
    (vector-set! is-prime 1 #f)

    (for ([i (in-range 2 n)])
      (when (vector-ref is-prime i)
        (set! cnt (add1 cnt))
        (vector-set! prime cnt i))

      (for ([j (in-range 1 (add1 cnt))])
        #:break (>= (* i (vector-ref prime j)) n)
        (vector-set! is-prime (* i (vector-ref prime j)) #f)
        #:break (= (modulo i (vector-ref prime j)) 0)
        #t)))

  (define (print-prime)
    (display (format "Total prime numbers: ~A~%" cnt))
    (for ([i (in-range 1 (add1 cnt))])
      (display (format "~A " (vector-ref prime i)))))

  (time (get-prime))
  ;;(print-prime)
  (display (format "Total prime numbers: ~A~%" cnt)))
