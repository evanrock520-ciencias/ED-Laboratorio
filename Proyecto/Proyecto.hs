-- Importaciones
import Aux(ordena, Dict(..))

-- Definición de Árbol
data Arbol a = Vacio | Arbol Char (Arbol Char) (Arbol Char) deriving (Eq, Show, Ord)


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
    uso: arbolHuffman [Dict 8 'r', Dict 4 'a'] = Arbol ' ' (Arbol ' ' Vacio (Arbol 'a' Vacio Vacio)) (Arbol 'r' Vacio Vacio)
-}

arbolHuffman :: [Dict] -> Arbol Char
arbolHuffman [] = Vacio
arbolHuffman (x:xs) = Arbol ' ' (arbolHuffman xs) (Arbol (devuelveChar x) Vacio Vacio)

{-
    función: creaArbol
    descripción: Crear un árbol de Huffman a partir de una lista de Dict ordenados.
    uso: creaArbol "cabeza" = Arbol ' ' (Arbol ' ' (Arbol ' ' (Arbol ' ' (Arbol ' ' Vacio (Arbol 'b' Vacio Vacio)) (Arbol 'c' Vacio Vacio)) (Arbol 'e' Vacio Vacio)) (Arbol 'z' Vacio Vacio)) (Arbol 'a' Vacio Vacio)
-}

creaArbol :: String -> Arbol Char
creaArbol "" = Vacio
creaArbol xs = arbolHuffman (crearListaApariciones xs)

{-
    función: devuelveChar
    descripción: Regresa el char de un Dict
    uso: devuelveChar (Dict 8 'e') = 'e'
-}

devuelveChar :: Dict -> Char
devuelveChar Nada = ' ';
devuelveChar (Dict n c) = c

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