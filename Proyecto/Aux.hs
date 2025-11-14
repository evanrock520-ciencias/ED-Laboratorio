module Aux(quicksort, Dict(..), HuffmanTree(..),contarApariciones, splitear, recorta, devuelveChar, borraTodos, crearListaApariciones, generarTabla, construirArbol, buscarCodigo, descifraBinario, codificar, creaArbol) where

-- Definiciones
data Dict = Nada |Dict Int Char deriving (Eq, Ord, Show)
data HuffmanTree = Vacio | Hoja Char | Nodo HuffmanTree HuffmanTree deriving (Eq, Show, Ord)


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

{-
    función: generarTablaAux
    descripción:
    uso: ghci> generarTablaAux (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'h')) (Hoja 'i')) (Hoja 's')) (Hoja 't')) (Hoja 'w')) (Hoja 'l')) (Hoja 'o')) ""
                = [('h',"0000001"),('i',"000001"),('s',"00001"),('t',"0001"),('w',"001"),('l',"01"),('o',"1")]
-}
generarTablaAux :: HuffmanTree -> String -> [(Char, String)]
generarTablaAux Vacio _ = []
generarTablaAux (Hoja c) camino = [(c, camino)]
generarTablaAux (Nodo izq der) camino = generarTablaAux izq (camino ++ "0") ++ generarTablaAux der (camino ++ "1")

{-
    función: generarTabla
    descripción:
    uso: generarTabla (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'h')) (Hoja 'i')) (Hoja 's')) (Hoja 't')) (Hoja 'w')) (Hoja 'l')) (Hoja 'o'))
                = [('h',"0000001"),('i',"000001"),('s',"00001"),('t',"0001"),('w',"001"),('l',"01"),('o',"1")]
-}
generarTabla :: HuffmanTree -> [(Char, String)]
generarTabla arbol = generarTablaAux arbol ""

{-
    función: construirArbol
    descripción: Transporta una lista de Dict a un árbol de Huffman
    uso: construirArbol [Dict 8 'r', Dict 4 'd', Dict 2 'a'] = Nodo (Nodo (Nodo Vacio (Hoja 'a')) (Hoja 'd')) (Hoja 'r')
-}

construirArbol :: [Dict] -> HuffmanTree
construirArbol [] = Vacio
construirArbol (x:xs) = Nodo (construirArbol xs) (Hoja (devuelveChar x))

{-
    función: buscarCodigo
    descripción:
    uso: buscarCodigo 'i' ([('h',"0000001"),('i',"000001"),('s',"00001"),('t',"0001"),('w',"001"),('l',"01"),('o',"1")]) = "000001"
-}
buscarCodigo :: Char -> [(Char, String)] -> String
buscarCodigo _ [] = error "No se puede buscar código en una lista vacía"
buscarCodigo c ((a, codigo):xs)
    | c == a = codigo
    | otherwise = buscarCodigo c xs

{-
    función: descifraBinario
    descripción: Descifra un carácter binario con un árbol de Huffman
    uso: descifraBinario "1" (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'a')) (Hoja 'e')) (Hoja 'h')) (Hoja 'm')) (Hoja 'n')) (Hoja 'o')) (Hoja 't')) = 't'
-}

descifraBinario :: String -> HuffmanTree -> Char
descifraBinario _ (Hoja r) = r
descifraBinario "" _ = error "No se puede descifrar la cadena vacía"
descifraBinario (x:xs) (Nodo izq der)
    | x == '1' = descifraBinario xs der
    | x == '0' = descifraBinario xs izq
    | otherwise = error "El código contiene un carácter no binario"

{-
    función: codificar
    descripción:
    uso: codificar "hollowsito" ([('h',"0000001"),('i',"000001"),('s',"00001"),('t',"0001"),('w',"001"),('l',"01"),('o',"1")])
        = "00000011010110010000100000100011"
-}
codificar :: String -> [(Char, String)] -> String
codificar [] _ = ""
codificar (c:cs) tabla =
    let codigoChar = buscarCodigo c tabla
    in codigoChar ++ codificar cs tabla

{-
    función: creaArbol
    descripción: Crear un árbol de Huffman a partir de una lista de Dict ordenada.
    uso: creaArbol "calabaza" = Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'b')) (Hoja 'c')) (Hoja 'l')) (Hoja 'z')) (Hoja 'a')
-}

creaArbol :: String -> HuffmanTree
creaArbol "" = Vacio
creaArbol xs = construirArbol (quicksort (crearListaApariciones xs))