-- Importaciones
import Aux

-- Definición de Árbol
data HuffmanTree = Vacio | Hoja Char | Nodo HuffmanTree HuffmanTree deriving (Eq, Show, Ord)

{-
    función: construirArbol
    descripción: Transporta una lista de Dict a un árbol de Huffman
    uso: construirArbol [Dict 8 'r', Dict 4 'd', Dict 2 'a'] = Nodo (Nodo (Nodo Vacio (Hoja 'a')) (Hoja 'd')) (Hoja 'r')
-}

construirArbol :: [Dict] -> HuffmanTree
construirArbol [] = Vacio
construirArbol (x:xs) = Nodo (construirArbol xs) (Hoja (devuelveChar x))

{-
    función: creaArbol
    descripción: Crear un árbol de Huffman a partir de una lista de Dict ordenada.
    uso: creaArbol "calabaza" = Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'b')) (Hoja 'c')) (Hoja 'l')) (Hoja 'z')) (Hoja 'a')
-}

creaArbol :: String -> HuffmanTree
creaArbol "" = Vacio
creaArbol xs = construirArbol (quicksort (crearListaApariciones xs))

{-
    función: usarCifrado
    descripción: Regresa el cifrado binario de una cadena usando el árbol de Huffman que le corresponde.
    uso: usarCifrado "totopo" = "0110110011"
-}

usarCifrado :: String -> String
usarCifrado "" = ""
usarCifrado s = codificar s (generarTabla(creaArbol s))

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
    función: descifrar
    descripción: Descifra una cadena cifrada con un árbol de Hauffman.
    uso: descifrar "00011001011011" (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'C')) (Hoja 'n')) (Hoja 't')) (Hoja 'a')) = "Cantata"
-}

descifrar :: String -> HuffmanTree -> String
descifrar "" _ = ""
descifrar _ Vacio = error "No se puede descifrar con un árbol vacío"
descifrar s t = descifraBinario (splitear s) t : descifrar (recorta s (length (splitear s))) t

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