;; SICP Practice: 2-10
(define (make-interval a b) (cons a b))
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
				 (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
  (let ((z (cons (min (- (car y)) (- (cdr y)))
				 (max (- (car y)) (- (cdr y))))))
	(make-interval (+ (lower-bound x) (lower-bound z))
				   (+ (upper-bound x) (upper-bound z)))))
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
		(p2 (* (lower-bound x) (upper-bound y)))
		(p3 (* (upper-bound x) (lower-bound y)))
		(p4 (* (upper-bound x) (upper-bound y))))
	(make-interval (min p1 p2 p3 p4)
				   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (let ((result (mul-interval x
							  (make-interval (/ 1.0 (upper-bound y))
											 (/ 1.0 (lower-bound y))))))
	(if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
		(error "divisor may be zero:" result)
		result)))

(define (display-interval x)
  (display (car x))
  (display " ~ ")
  (display (cdr x)))


(define interval-1 (cons 6.12 7.48))
(define interval-2 (cons -4.465 4.935))

(begin
  (display-interval (div-interval interval-1 interval-2))
  (newline))
