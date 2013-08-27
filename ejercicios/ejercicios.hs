module Main (main) where

assert :: Bool -> Bool
assert False = error "assertion failed!"
assert True = True

{-
1) Definir una funcion recursiva sumatoria, que dado un entero n, retorne el
resultado de la suma 1+2+3+...+(n-1)+n.
-}

sumatoria(0) = 0
sumatoria(x) = x + sumatoria(x-1)

test_sumatoria = assert(sumatoria(1) == 1 && sumatoria(2) == 3 && sumatoria(3) == 6)

{-
2) Definir una funcion recursiva factorial, que dado un numero entero positivo,
retorne el factorial de ese numero.
-}

factorial(0) = 1
factorial(x) = x * factorial(x-1)

test_factorial = assert(factorial(1) == 1 && factorial(2) == 2 && factorial(3) == 6)

{-
3) Definir una funcion recursiva fibonacci, que dado un entero n, retorne el
n-esimo termino de la sucesion de Fibonacci (1, 1, 2, 3, 5, 8, 13, ..).
-}

fibonacci(x) | x > 1  = fibonacci(x-1) + fibonacci(x - 2)
             | x == 0 = 1
             | x == 1 = 1

test_fibonacci = assert(fibonacci(0) == 1 && fibonacci(1) == 1 && fibonacci(2) == 2 
  && fibonacci(3) == 3 && fibonacci(4) == 5)

{-
4) Definir una funcion recursiva producto, que dados dos numeros enteros z y v,
retorne z*v mediante sumas sucesivas.
-}

{-
5) Definir funciones recursivas cociente y resto, que a partir de dos numeros
enteros, retorne el cociente y el resto entre ellos respectivamente, a partir
de la tecnica de restas sucesivas. Expresar cual seria el orden bien fundado
entre los elementos del dominio para esta funcion.
-}

{-
6) Definir la funcion recursiva mcd (maximo comun divisor), que dados dos
numeros enteros positivos, retorne el maximo comun divisor entre ellos.
-}

{-
7) Definir la funcion recursiva combinatorio, que dados dos numeros enteros no
negativos n y k (0 <= k <= n), retorne el numero combinatorio en base a ellos.
-}


{- main -}
main = print(test_sumatoria && test_factorial && test_fibonacci)
