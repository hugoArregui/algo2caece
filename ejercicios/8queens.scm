(use srfi-1)

(define empty-board '(
                      (1 . 1) (1 . 2) (1 . 3) (1 . 4) (1 . 5) (1 . 6) (1 . 7) (1 . 8)
                      (2 . 1) (2 . 2) (2 . 3) (2 . 4) (2 . 5) (2 . 6) (2 . 7) (2 . 8)
                      (3 . 1) (3 . 2) (3 . 3) (3 . 4) (3 . 5) (3 . 6) (3 . 7) (3 . 8)
                      (4 . 1) (4 . 2) (4 . 3) (4 . 4) (4 . 5) (4 . 6) (4 . 7) (4 . 8)
                      (5 . 1) (5 . 2) (5 . 3) (5 . 4) (5 . 5) (5 . 6) (5 . 7) (5 . 8)
                      (6 . 1) (6 . 2) (6 . 3) (6 . 4) (6 . 5) (6 . 6) (6 . 7) (6 . 8)
                      (7 . 1) (7 . 2) (7 . 3) (7 . 4) (7 . 5) (7 . 6) (7 . 7) (7 . 8)
                      (8 . 1) (8 . 2) (8 . 3) (8 . 4) (8 . 5) (8 . 6) (8 . 7) (8 . 8)))

(define (find-available-positions p available-positions)
  (let ((px (car p))
        (py (cdr p)))
    (remove (lambda (e)
              (let ((ex (car e))
                    (ey (cdr e)))
                (or (= ex px)
                    (= ey py)
                    (= (abs (- px ex))
                       (abs (- py ey)))))) available-positions)))

(define (solver solution available-positions)
  (cond ((= (length solution) 8)
         solution)
        ((null? available-positions)
         #f) 
        (else
          (let loop ((available-positions available-positions))
            (cond ((null? available-positions)
                   #f)
                  ((let ((p (car available-positions)))
                     (solver (cons p solution) (find-available-positions p available-positions))) => identity)
                  (else 
                    (loop (cdr available-positions))))))))

(define (setup-board positions board)
  (if (null? positions)
    board
    (setup-board (cdr positions) (find-available-positions (car positions) board))))

(define (solve #!optional (solution '()))
  (solver solution (setup-board solution empty-board)))

(let ((s (solve)))
  (assert s)
  (assert (list= s (solve s))))

(assert (not (solve '((1 . 6) (2 . 4) (3 . 7) (4 . 5) (5 . 8) (7 . 1)))))
(assert (not (solve '((1 . 6) (2 . 4) (3 . 7) (4 . 5) (5 . 8) (7 . 1) (8 . 3)))))
