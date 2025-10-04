module Aux(listaArbolReversa, inserta, altura, Arbol(Vacio, AB)) where

-- Tipo de dato para Árbol
data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

{-
    Función: altura
    Descripción: Saca la altura de un árbol.
    Uso: altura (AB 1 (AB 2 Vacio (AB 7 Vacio Vacio)) Vacio) = 3
-}

altura :: Arbol a -> Int
altura Vacio = 0
altura (AB r Vacio Vacio) = 1
altura (AB r t1 t2) = 1 + max (altura t1) (altura t2)

{-
    Función: inserta
    Descripción: Inserta un elemento en un árbol 
    Uso: inserta 1 Vacio = AB 1 Vacio Vacio
-}

inserta :: Ord a => a -> Arbol a -> Arbol a
inserta n Vacio = AB n Vacio Vacio
inserta n (AB r t1 t2)
    | n == r = AB r t1 t2
    | n < r  = AB r (inserta n t1) t2
    | n > r  = AB r t1 (inserta n t2)

{-
    Función: listaArbolReversa
    Descripción: Regresa un árbol binario de búsqueda a partir de una lista ordenada
    y en reversa.
    Uso: listaArbolReversa [4,9,5,7,1] = AB 1 Vacio (AB 7 (AB 5 (AB 4 Vacio Vacio) Vacio) (AB 9 Vacio Vacio))
-}

listaArbolReversa :: (Ord a) => [a] -> Arbol a
listaArbolReversa [] = Vacio
listaArbolReversa (x:xs) = inserta x (listaArbolReversa xs) 