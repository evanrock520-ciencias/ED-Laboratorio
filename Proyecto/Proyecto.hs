-- Importaciones
import Data.Char()

-- Definición de Árbol
data Arbol a = Vacio | Arbol a (Arbol a) (Arbol a) deriving (Eq, Show, Ord)

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

crearListaApariciones :: String -> [Int]
crearListaApariciones "" = []
crearListaApariciones (x:xs) = ordena (contarApariciones x (x:xs) : crearListaApariciones (borraTodos x xs))

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
    descripción: Ordena una lista de mayor a menor.
    uso: ordena [7, 98, 65, 100, 54, 12, 1] = [100,98,65,54,12,7,1]
-}

ordena :: Ord a => [a] -> [a]
ordena [] = []
ordena (x:xs) = misterio x (ordena xs)
