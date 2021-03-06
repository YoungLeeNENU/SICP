;; SICP Practice: 2-30
;; square-tree use map
(define (square-tree items)
  (map (lambda (sub-tree)
  	 (if (pair? sub-tree)
	     (square-tree sub-tree)
	     ((lambda (x) (* x x)) sub-tree)))
       items))

(begin
  (define sample (list 1
		       (list 2 (list 3 4) 5)
		       (list 6 7)))
  (display (square-tree sample))
  (newline))
