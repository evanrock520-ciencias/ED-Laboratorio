-- Importaciones
import Aux(ordena, Dict(..))

-- Definición de Árbol
data Arbol a = Vacio | Arbol Dict (Arbol Dict) (Arbol Dict) deriving (Eq, Show, Ord)


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

crearListaApariciones :: String -> [Dict]
crearListaApariciones "" = []
crearListaApariciones (x:xs) = ordena (Dict (contarApariciones x (x:xs)) x : crearListaApariciones (borraTodos x xs))

{-
    función: arbolHuffman
    descripción: Transporta una lista de Dict a un árbol de Huffman
    uso: ghci> arbolHuffman [Dict 8 'r', Dict 4 'a', Dict 2 'n'] = Arbol (Dict 0 ' ') (Arbol (Dict 0 ' ') (Arbol (Dict 0 ' ') Vacio (Arbol (Dict 2 'n') Vacio Vacio)) (Arbol (Dict 4 'a') Vacio Vacio)) (Arbol (Dict 8 'r') Vacio Vacio)
-}

arbolHuffman :: [Dict] -> Arbol a
arbolHuffman [] = Vacio
arbolHuffman (x:xs) = Arbol (Dict 0 ' ') (arbolHuffman xs) (Arbol x Vacio Vacio) 

{-
    función: creaArbol
    descripción: Crear un árbol de Huffman a partir de una lista de Dict ordenados.
    uso: ghci> creaArbol "cabeza" = Arbol (Dict 0 ' ') (Arbol (Dict 0 ' ') (Arbol (Dict 0 ' ') (Arbol (Dict 0 ' ') (Arbol (Dict 0 ' ') Vacio (Arbol (Dict 1 'b') Vacio Vacio)) (Arbol (Dict 1 'c') Vacio Vacio)) (Arbol (Dict 1 'e') Vacio Vacio)) (Arbol (Dict 1 'z') Vacio Vacio)) (Arbol (Dict 2 'a') Vacio Vacio)
-}

creaArbol :: String -> Arbol a
creaArbol "" = Vacio
creaArbol xs = arbolHuffman (crearListaApariciones xs)




