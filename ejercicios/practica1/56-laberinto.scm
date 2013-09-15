(use srfi-1)

(define (mover libres posicion dir)
  (let ((p (case dir
             ((derecha)
              (cons (+ (car posicion) 1) (cdr posicion)))
             ((izquierda)
              (cons (- (car posicion) 1) (cdr posicion)))
             ((arriba)
              (cons (car posicion) (+ (cdr posicion) 1)))
             ((abajo)
              (cons (car posicion) (- (cdr posicion) 1))))))
    (if (member p libres)
      p
      #f)))

(define (remove-coord c l)
  (remove (cut equal? c <>) l))

(define (laberinto-aux libres salida dir-salida llegada camino)
  (let ((r (mover libres salida dir-salida)))
    (cond ((not r)
           #f)
          ((equal? r llegada)
           (cons dir-salida camino))
          (else
            (or (laberinto-aux (remove-coord r libres) r 'derecha llegada (cons dir-salida camino))
                (laberinto-aux (remove-coord r libres) r 'izquierda llegada (cons dir-salida camino))
                (laberinto-aux (remove-coord r libres) r 'arriba llegada (cons dir-salida camino))
                (laberinto-aux (remove-coord r libres) r 'abajo llegada (cons dir-salida camino)))))))

(define (laberinto libres salida dir-salida llegada)
  (reverse (laberinto-aux libres salida dir-salida llegada '())))

(define lab1 '((0 . 4) (0 . 6) 
               (1 . 4) (1 . 6) 
               (2 . 2) (2 . 3) (2 . 4) (2 . 5) (2 . 6)
               (3 . 3) 
               (4 . 0) (4 . 1) (4 . 2) (4 . 3) (4 . 4) 
               (5 . 2) 
               (6 . 2)))

(print (laberinto lab1 '(0 . 6) 'derecha '(6 . 2)))




