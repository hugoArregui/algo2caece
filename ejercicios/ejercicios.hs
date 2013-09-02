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

fibonacci(x) 
    | x > 1  = fibonacci(x-1) + fibonacci(x - 2)
    | x == 0 = 1
    | x == 1 = 1

test_fibonacci = assert(fibonacci(0) == 1 && fibonacci(1) == 1 && fibonacci(2) == 2 
  && fibonacci(3) == 3 && fibonacci(4) == 5)

{-
4) Definir una funcion recursiva producto, que dados dos numeros enteros z y v,
retorne z*v mediante sumas sucesivas.
-}

producto(0, _) = 0
producto(z, v) = v + producto(z-1, v)

test_producto = assert(producto(0, 3) == 0 && producto(1, 4) == 4 && producto(2, 7) == 14 
  && producto(3, 12) == 36)

{- 
5) Definir funciones recursivas cociente y resto, que a partir de dos numeros
enteros, retorne el cociente y el resto entre ellos respectivamente, a partir
de la tecnica de restas sucesivas. Expresar cual seria el orden bien fundado
entre los elementos del dominio para esta funcion.
-}

cociente'(a, b, c) 
    | b == 0    = error "division by zero"
    | a < b     = c
    | otherwise = cociente'(a - b, b, c + 1)

cociente(a, b) = cociente'(a, b, 0)

test_cociente = assert(cociente(0, 3) == 0 && cociente(4, 2) == 2 && cociente(13, 1) == 13 
  && cociente(13, 2) == 6 && cociente(3, 3) == 1)

resto(a, b) = a - b * cociente(a, b)

test_resto = assert(resto(0, 3) == 0 && resto(4, 2) == 0 && resto(13, 1) == 0 
  && resto(13, 2) == 1 && resto(33, 12) == 9)

{-
6) Definir la funcion recursiva mcd (maximo comun divisor), que dados dos
numeros enteros positivos, retorne el maximo comun divisor entre ellos.
-}

mcd'(a, b, c) = if (resto(a, c) == 0 && resto(b, c) == 0) then c else mcd'(a, b, c - 1)
 
mcd(a, b)
    | a == 0     = 0
    | b == 0     = 0
    | otherwise = mcd'(a, b, min a b)

test_mcd = assert(mcd(0, 3) == 0 && mcd(4, 2) == 2 && mcd(13, 1) == 1 && mcd(8, 4) == 4 && mcd(42, 56) == 14)

{-
7) Definir la funcion recursiva combinatorio, que dados dos numeros enteros no
negativos n y k (0 <= k <= n), retorne el numero combinatorio en base a ellos.
-}

combinatorio(n, k) = factorial(n) / ((factorial k) * (factorial (n - k)))

test_combinatorio = assert(combinatorio(3, 2) == 3 && combinatorio(8, 2) == 28)

{- main -}
main = print(test_sumatoria && test_factorial && test_fibonacci && test_producto 
    && test_cociente && test_resto && test_mcd && test_combinatorio)
