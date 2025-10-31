-- Importaciones
import Aux(ordena, Dict(..), contarApariciones, splitear, recorta, devuelveChar, borraTodos, crearListaApariciones)

-- Definición de Árbol
data Arbol a = Vacio | Arbol Char (Arbol Char) (Arbol Char) deriving (Eq, Show, Ord)
data HuffmanThree = Va | Hoja Char | Nodo HuffmanThree HuffmanThree HuffmanThree deriving (Eq, Show, Ord)

{-
    función: arbolHuffman
    descripción: Transporta una lista de Dict a un árbol de Huffman
    uso: arbolHuffman [Dict 8 'r', Dict 4 'a'] = Arbol ' ' (Arbol ' ' Vacio (Arbol 'a' Vacio Vacio)) (Arbol 'r' Vacio Vacio)
-}

arbolHuffman :: [Dict] -> Arbol Char
arbolHuffman [] = Vacio
arbolHuffman (x:xs) = Arbol '\t' (arbolHuffman xs) (Arbol (devuelveChar x) Vacio Vacio)

{-
    función: creaArbol
    descripción: Crear un árbol de Huffman a partir de una lista de Dict ordenados.
    uso: creaArbol "cabeza" = Arbol ' ' (Arbol ' ' (Arbol ' ' (Arbol ' ' (Arbol ' ' Vacio (Arbol 'b' Vacio Vacio)) (Arbol 'c' Vacio Vacio)) (Arbol 'e' Vacio Vacio)) (Arbol 'z' Vacio Vacio)) (Arbol 'a' Vacio Vacio)
-}

creaArbol :: String -> Arbol Char
creaArbol "" = Vacio
creaArbol xs = arbolHuffman (crearListaApariciones xs)

{-
    función: existeEn
    descripción: Determina si un carácter existe en un árbol
    uso: existeEn 'b' (Arbol ' ' (Arbol ' ' Vacio (Arbol 'a' Vacio Vacio)) (Arbol 'p' Vacio Vacio)) = False
-}

existeEn :: Char -> Arbol Char -> Bool
existeEn _ Vacio = False
existeEn char (Arbol c izq der)
    | char == c = True
    | otherwise = existeEn char izq || existeEn char der


{-
    función: determinaBinario
    descripción: Cifra una cadena a partir de un árbol de Huffman.
    uso: determinaBinario 'p' (Arbol ' ' (Arbol ' ' Vacio (Arbol 'a' Vacio Vacio)) (Arbol 'p' Vacio Vacio))  = "1"
-}

determinaBinario :: Char -> Arbol Char -> String
determinaBinario _ Vacio = "" 
determinaBinario x (Arbol c izq der)
    | x == c = "" 
    | existeEn x izq = '0' : determinaBinario x izq 
    | existeEn x der = '1' : determinaBinario x der 
    | otherwise = ""

{-
    función: cifrar
    descripción: Regresa el cifrado de una cadena.
    uso: cifrar "papaya" (Arbol ' ' (Arbol ' ' (Arbol ' ' Vacio (Arbol 'y' Vacio Vacio)) (Arbol 'p' Vacio Vacio)) (Arbol 'a' Vacio Vacio)) = "0110110011"
-}

cifrar :: String -> Arbol Char -> String
cifrar "" _ = ""
cifrar _ Vacio = error "No se puede cifrar con el árbol vacío"
cifrar (x:xs) t = determinaBinario x t ++ cifrar xs t

{-
    función: usarCifrado
    descripción: Regresa el cifrado binario de una cadena usando el árbol de Huffman que le corresponde.
    uso: usarCifrado "totopo" = "0110110011"
-}

usarCifrado :: String -> String
usarCifrado "" = ""
usarCifrado s = cifrar s (creaArbol s)

{-
    función: descifraBinario
    descripción: Descifra un carácter binario con un árbol de Huffman
    uso: descifraBinario "1" (Arbol ' ' (Arbol ' ' (Arbol ' ' Vacio (Arbol 'y' Vacio Vacio)) (Arbol 'p' Vacio Vacio)) (Arbol 'a' Vacio Vacio)) = 'a'
-}

descifraBinario :: String -> Arbol Char -> Char
descifraBinario _ (Arbol r Vacio Vacio) = r
descifraBinario "" _ = error "No se puede descifrar la cadena vacía"
descifraBinario (x:xs) (Arbol _ izq der)
    | x == '1' = descifraBinario xs der
    | x == '0' = descifraBinario xs izq
    | otherwise = error "El código contiene un carácter no binario"

{-
    función: descifrar
    descripción: Descifra una cadena cifrada con un árbol de Hauffman.
    uso: descifrar "01100010011" (Arbol ' ' (Arbol ' ' (Arbol ' ' (Arbol ' ' Vacio (Arbol 'c' Vacio Vacio)) (Arbol 'h' Vacio Vacio)) (Arbol 'm' Vacio Vacio)) (Arbol 'i' Vacio Vacio)) = "michi"
-}

descifrar :: String -> Arbol Char -> String
descifrar "" _ = ""
descifrar _ Vacio = error "No se puede descifrar con un árbol vacío"
descifrar s t = descifraBinario (splitear s) t : descifrar (recorta s (length (splitear s))) t
