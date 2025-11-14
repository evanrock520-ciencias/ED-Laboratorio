-- Importaciones
import Aux

{-
    función: usarCifrado
    descripción: Regresa el cifrado binario de una cadena usando el árbol de Huffman que le corresponde.
    uso: usarCifrado "totopo" = "0110110011"
-}

usarCifrado :: String -> String
usarCifrado "" = ""
usarCifrado s = codificar s (generarTabla(creaArbol s))

{-
    función: descifrar
    descripción: Descifra una cadena cifrada con un árbol de Hauffman.
    uso: descifrar "00011001011011" (Nodo (Nodo (Nodo (Nodo Vacio (Hoja 'C')) (Hoja 'n')) (Hoja 't')) (Hoja 'a')) = "Cantata"
-}

descifrar :: String -> HuffmanTree -> String
descifrar "" _ = ""
descifrar _ Vacio = error "No se puede descifrar con un árbol vacío"
descifrar s t = descifraBinario (splitear s) t : descifrar (recorta s (length (splitear s))) t
