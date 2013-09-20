(use srfi-1)

(define-record tree raiz si sd)

(define ConsArbBin make-tree)
(define esArbVacio null?)
(define raiz tree-raiz)
(define subArbBinDer tree-sd)
(define subArbBinIzq tree-si)
(define AV '())

(define (lchilds n t)
  (let ((si (subArbBinIzq t))
        (sd (subArbBinDer t)))
    (remove (compose esArbVacio cdr) (list (cons n si) (cons n sd)))))

(define (bf t)
  (let loop ((queue (list (cons 1 t))))
    (if (not (null? queue))
      (let* ((r (car queue))
             (n (car r))
             (t (cdr r)))
        (cons (cons n (raiz t)) 
              (loop (append (lchilds (+ n 1) t) (cdr queue)))))
      '())))

(define (print-tree t)
  (unless (esArbVacio t)
    (let loop ((r (bf t)))
      (unless (null? r)
        (let ((p (car r)))
          (print (format "~a) ~a" (car p) (cdr p))))
        (loop (cdr r))))))

