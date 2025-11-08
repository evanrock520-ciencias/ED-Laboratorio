module Aux(quicksort, Dict(..), contarApariciones, splitear, recorta, devuelveChar, borraTodos, crearListaApariciones) where

-- Definiciones
data Dict = Nada |Dict Int Char deriving (Eq, Ord, Show)

{-
    función: quicksort
    descripción: ordena una lista de Dict por el algoritmo de quicksort
    uso: quicksort [Dict 2 's',Dict 2 'l',Dict 2 'e',Dict 2 'a',Dict 2 ' ',Dict 1 'r',Dict 1 'o',Dict 1 'm',Dict 1 'k',Dict 1 'h']
                        = [Dict 2 's',Dict 2 'l',Dict 2 'e',Dict 2 'a',Dict 2 ' ',Dict 1 'r',Dict 1 'o',Dict 1 'm',Dict 1 'k',Dict 1 'h']
-}
quicksort :: [Dict] -> [Dict]
quicksort [] = []
quicksort (x:xs) =
    let mayores = [y | y <- xs, y >= x]
        menores = [y | y <- xs, y < x]
    in quicksort mayores ++ [x] ++ quicksort menores

{-
    función: contarApariciones
    descripción: Cuenta el número de apariciones de un carácter en un string.
    uso: contarApariciones 'a' "haskell es amor" = 2
-}

contarApariciones :: Char -> String -> Int
contarApariciones _ "" = 0
contarApariciones c (x:xs)
    | c == x = 1 + contarApariciones c xs
    | otherwise = contarApariciones c xs

{-
    función: splitear
    descripción: Obtiene las cadenas binarias para el árbol de Huffman
    uso: splitear "000101" = "0001"
-}

splitear :: String -> String
splitear "" = ""
splitear (x:xs) = 
    if x == '1'
        then [x]
    else x : splitear xs

{-
    función: recorta
    descripción: Regresa una cadena recortada n posiciones
    uso: recorta "Gumball" 3 = "ball" 
-}

recorta :: String -> Int -> String
recorta "" _ = ""
recorta xs 0 = xs
recorta (x:xs) n = recorta xs (n-1)

{-
    función: devuelveChar
    descripción: Regresa el char de un Dict
    uso: devuelveChar (Dict 8 'e') = 'e'
-}

devuelveChar :: Dict -> Char
devuelveChar Nada = ' '
devuelveChar (Dict n c) = c

{-
    función: borraTodos
    descripción: Borra todas las apariciones de un carácter en una cadena.
    uso: BorraTodos 's' "salsita" = "alita"
-}

borraTodos :: Char -> String -> String
borraTodos _ "" = ""
borraTodos x xs = filter (/= x) xs

{-
    función: crearListaApariciones
    descripción: Crea una lista con la frecuencia de aparición de cada carácter en el String.
    uso: crearListaApariciones "totopo" = [2,3,1]
-}

crearListaApariciones :: String -> [Dict]
crearListaApariciones "" = []
crearListaApariciones (x:xs) = Dict (contarApariciones x (x:xs)) x : crearListaApariciones (borraTodos x xs)