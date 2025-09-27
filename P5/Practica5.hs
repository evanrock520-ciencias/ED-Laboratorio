module Practica5(hollerBack, palindromo, replica, recuperaElemento, rota, extranio) where
import Data.Char
import Aux(reversa)


{-
    Función: hollerBack
    Descripción: Toma una cadena en minusculas y la devuelve en mayúsculas
    Uso: hollerBack "haskell" = "HASKELL"
-}

hollerBack :: String -> String
hollerBack "" = ""
hollerBack (x:xs) = toUpper x : hollerBack xs

{-
    Función: palindromo
    Descripción: Toma una lista de cualquier tipo y devuelve True si es palíndromo
    Uso: palindromo ["a", "n", "a"] = True

-}

palindromo :: Eq a => [a] -> Bool
palindromo [] = True
palindromo xs = reversa xs == xs

{-
    Función: replica
    Descripción: Toma un entero x, un entero n y devuelve una lista que consta
    de n apariciones de x.
    Uso: replica 17 8 = [17,17,17,17,17,17,17,17]

-}

replica :: Int -> Int -> [Int]
replica _ 0 = []
replica x n = x : replica x (n - 1)

{-
    Función: recuperarElemento
    Descripción: Toma una lista y devuelve el elemento del indice es-
    pecificado en la lista.
    Uso: recuperarElemento [1,2,3,4,5,6] 4 = 5

-}

recuperaElemento :: [Int] -> Int -> Int
recuperaElemento (x:xs) 0 = x
recuperaElemento (x:xs) n =
    if n < 0
        then error "Índice inválido"
    else
        recuperaElemento xs (n - 1)

{-
    Función: rota
    Descripción: Toma una lista y traslada el primer elemento de una lista xs al final.
    Se repite esta acción n veces usando la lista resultante en cada paso.
    Uso: rota [3,6,9,12,15] 4 = [15,3,6,9,12]

-}

rota :: [Int] -> Int -> [Int]
rota [] n = []
rota xs 0 = xs
rota (x:xs) n = rota (xs ++ [x]) (n - 1)

{-
    Función: extranio
    Descripción: Toma como entrada un entero positivo. Si es par lo divide entre 2
    si es impar lo multiplica por 3 y le suma 1.
    Uso: extranio 12 = [6,3,10,5,16,8,4,2,1,1]

-}

extranio :: Int -> [Int]
extranio 1 = [1]
extranio n =
    if even n
        then (n `div` 2) : extranio (n `div` 2)
        else (n * 3 + 1) : extranio ((n *  3) + 1 )