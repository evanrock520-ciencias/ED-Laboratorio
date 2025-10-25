module Aux(ordena, Dict(..), contarApariciones, splitear, recorta, devuelveChar, borraTodos) where

-- Definiciones
data Dict = Nada |Dict Int Char deriving (Eq, Ord, Show)

{-
    función: misterio
    descripción: Añade un elemento de manera ordena a una lista ordenada de mayor a menor.
    uso: misterio 7 [9,8,6,5] = [9,8,7,6,5]
-}

misterio :: Ord t => t -> [t] -> [t]
misterio x [] = [x]
misterio n (x:xs) = if n >= x then n : (x:xs) else x : misterio n xs

{-
    función: ordena
    descripción: Ordena una lista de Dict de mayor a menor orden.
    uso: ordena [Dict 2 'a', Dict 3 'z', Dict 1 'c'] = [Dict 3 'z',Dict 2 'a',Dict 1 'c']
-}

ordena :: [Dict] -> [Dict]
ordena [] = []
ordena (d:xs) = misterio d (ordena xs)

{-
    función: contarApariciones
    descripción: Cuenta el número de apariciones de un carácter en un string.
    uso: contarApariciones 'a' "haskell es amor" = 2
-}

contarApariciones :: Char -> String -> Int
contarApariciones _ "" = 0;
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
devuelveChar Nada = ' ';
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
crearListaApariciones (x:xs) = ordena (Dict (contarApariciones x (x:xs)) x : crearListaApariciones (borraTodos x xs))