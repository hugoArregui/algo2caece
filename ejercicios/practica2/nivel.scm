(include "arbol.scm")

(define (nivel x arbol)
  (let loop ((arbol arbol)
             (n     1))
    (cond 
      ((esArbVacio arbol)
       (cons #f n))
      ((= (raiz arbol) x)
       (cons #t n))
      (else
        (let ((r (loop (subArbBinIzq arbol) (+ n 1))))
          (if (car r)
            r
            (let ((r2 (loop (subArbBinDer arbol) (+ n 1))))
              (if (car r2)
                r2
                (cons #f (max (cdr r) (cdr r2)))))))))))


(print (nivel 9 (ConsArbBin 1 (ConsArbBin 2 (ConsArbBin 4 AV AV) (ConsArbBin 5 AV AV)) (ConsArbBin 3 AV AV))))
       ;1
   ;2       3
 ;4   5

