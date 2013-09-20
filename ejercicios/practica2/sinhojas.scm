(include "arbol.scm")

(define (esHoja a)
  (and (esArbVacio (subArbBinIzq a))
       (esArbVacio (subArbBinDer a))))

(define (sinHojas t)
  (let ((si (subArbBinIzq t))
        (sd (subArbBinDer t)))
    (if (esArbVacio t)
      AV
      (ConsArbBin (raiz t)
                  (if (esHoja si) AV si)
                  (if (esHoja sd) AV sd)))))

(print-tree (sinHojas (ConsArbBin 1 (ConsArbBin 2 AV AV) (ConsArbBin 3 AV AV))))
