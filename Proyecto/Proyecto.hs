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