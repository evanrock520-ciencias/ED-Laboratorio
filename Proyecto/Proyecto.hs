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
    función: crearListaApariciones
    descripción: Crea una lista con la frecuencia de aparición de cada carácter en el String.
    uso: crearListaApariciones "totopo" = [2,3,1]
-}

crearListaApariciones :: String -> [Int]
crearListaApariciones "" = []
crearListaApariciones (x:xs) = contarApariciones x (x:xs) : crearListaApariciones (borraTodos x xs)

borraTodos :: Char -> String -> String
borraTodos _ "" = ""
borraTodos x xs = filter (/= x) xs
