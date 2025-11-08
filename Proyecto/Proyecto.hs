-- Importaciones
import Aux(quicksort, Dict(..), contarApariciones, splitear, recorta, devuelveChar, borraTodos, crearListaApariciones)

-- Definición de Árbol
data HuffmanTree = Vacio | Hoja Char | Nodo HuffmanTree HuffmanTree deriving (Eq, Show, Ord)

{-
    función: arbolHuffman
    descripción: Transporta una lista de Dict a un árbol de Huffman
    uso: arbolHuffman [Dict 8 'r', Dict 4 'd', Dict 2 'a'] = Nodo (Nodo (Nodo Vacio (Hoja 'a')) (Hoja 'd')) (Hoja 'r')
-}

arbolHuffman :: [Dict] -> HuffmanTree
arbolHuffman [] = Vacio
arbolHuffman (x:xs) = Nodo (arbolHuffman xs) (Hoja (devuelveChar x))

{-
    función: creaArbol
    descripción: Crear un árbol de Huffman a partir de una lista de Dict ordenada.
    uso: creaArbol "calabaza" = Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'b')) (Hoja 'c')) (Hoja 'l')) (Hoja 'z')) (Hoja 'a')
-}

creaArbol :: String -> HuffmanTree
creaArbol "" = Vacio
creaArbol xs = arbolHuffman (crearListaApariciones xs)

{-
    función: existeEn
    descripción: Determina si un carácter existe en un árbol
    uso: existeEn 'g' (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'a')) (Hoja 'e')) (Hoja 'h')) (Hoja 'm')) (Hoja 'n')) (Hoja 'o')) (Hoja 't')) = False
-}

existeEn :: Char -> HuffmanTree -> Bool
existeEn _ Vacio = False
existeEn char (Hoja c) = char == c
existeEn char (Nodo izq der) = existeEn char izq || existeEn char der


{-
    función: determinaBinario
    descripción: Cifra una cadena a partir de un árbol de Huffman.
    uso: determinaBinario 'm' (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'a')) (Hoja 'e')) (Hoja 'h')) (Hoja 'm')) (Hoja 'n')) (Hoja 'o')) (Hoja 't')) = "0001"
-}

determinaBinario :: Char -> HuffmanTree -> String
determinaBinario _ Vacio = ""
determinaBinario x (Hoja c)
    | x == c    = ""     
    | otherwise = "#" 
determinaBinario x (Nodo izq der)
    | existeEn x izq = '0' : determinaBinario x izq
    | existeEn x der = '1' : determinaBinario x der
    | otherwise = ""


{-
    función: cifrar
    descripción: Regresa el cifrado de una cadena.
    uso: cifrar "papaya" (Nodo (Nodo (Nodo Vacio (Hoja 'y')) (Hoja 'p')) (Hoja 'a')) = "0110110011"
-}

cifrar :: String -> HuffmanTree -> String
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
