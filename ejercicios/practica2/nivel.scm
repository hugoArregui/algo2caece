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

;nivel'(a, AV, n) = par(false, n)
;nivel'(a, ConsArbBin(x, si, sd), n) =
  ;if (a = x) then
    ;par(true, n)
  ;else
    ;r <- nivel'(a, si, n + 1)
    ;if #1(r) then
      ;r
    ;else
      ;r2 <- nivel'(a, sd, n + 1)
      ;if #1(r2) then
        ;r2
      ;else
        ;par(false, max(#2(r), #2(r2)))
      ;end
    ;end
  ;end
      
  
    
