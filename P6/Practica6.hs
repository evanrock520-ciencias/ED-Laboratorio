module Practica6(nVacios, refleja, minimo, esBalanceado, listaArbol, recorrido, Aux.Arbol(Vacio, AB), TipoRecorrido(InOrden, PreOrden, PosOrden)) where

import Aux(listaArbolReversa, inserta, altura, Arbol(Vacio, AB))

data TipoRecorrido = InOrden | PreOrden | PosOrden deriving (Eq, Show)

{-
    Función: nVacios
    Descripción: Devuelve el total de nodos vacios en un árbol
    Uso: 
-}

nVacios :: Aux.Arbol a -> Int
nVacios Vacio = 1
nVacios (AB r t1 t2) = nVacios t1 + nVacios t2

{-
    Función: refleja
    Descripción: Hace que los subárboles izquierdos se vuelvan
    subárboles derechos y viceversa.
    Uso:
-}

refleja :: Aux.Arbol a -> Aux.Arbol a
refleja Vacio = Vacio
refleja (AB r t1 t2) = AB r (refleja t2) (refleja t1)

{-
    Función: minimo
    Descripción: Devuelve el elemento mínimo de un árbol.
    Uso: minimo (AB 2 (AB 10 Vacio Vacio) (AB 1 Vacio Vacio)) = 1
-}

minimo :: (Eq a) => (Ord a) => Aux.Arbol a -> a
minimo Vacio = error "El árbol vacío no tiene elementos"
minimo (AB r Vacio Vacio) = r
minimo (AB r t1 Vacio) = min r (minimo t1)
minimo (AB r Vacio t2) = min r (minimo t2)
minimo (AB r t1 t2) = min r (min (minimo t1)(minimo t2))

{-
    Función: recorrido
    Descripción: Regresa una lista del árbol con el recorrido inOrden.
    Uso: recorrido ( AB 4 Vacio ( AB 1 (AB 8 (AB 12 Vacio Vacio) Vacio ) ( AB 10 Vacio Vacio ) ) ) = [4,12,8,1,10]
-}

recorrido :: Aux.Arbol a -> TipoRecorrido -> [a]
recorrido Vacio tipoRecorrido = []
recorrido (AB r t1 t2) InOrden = recorrido t1 InOrden ++ [r] ++ recorrido t2 InOrden
recorrido (AB r t1 t2) PreOrden = r : (recorrido t1 PreOrden ++ recorrido t2 PreOrden)
recorrido (AB r t1 t2) PosOrden = recorrido t1 PosOrden ++ recorrido t2 PosOrden ++ [r]


{-
    Función: esBalanceado
    Descripción: Verifica si un árbol está balanceado.
    Uso: balanceado (AB 1 (AB 2 Vacio Vacio) (AB 3 (AB 6 Vacio Vacio) Vacio)) = True
-}

esBalanceado :: Aux.Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB r t1 t2) = abs (altura t1 - altura t2) <= 1 && esBalanceado t1 && esBalanceado t2

{-
    Función: listaArbol
    Descripción: Recibe una lista de elementos y regresa un árbol binario
    de búsqueda
    Uso: listaArbol [19, 28, 6, 87, 9, 12, 54] = AB 19 (AB 6 Vacio (AB 9 Vacio (AB 12 Vacio Vacio))) (AB 28 Vacio (AB 87 (AB 54 Vacio Vacio) Vacio))
-}

listaArbol :: (Ord a) => [a] -> Aux.Arbol a
listaArbol [] = Vacio
listaArbol xs = listaArbolReversa(reverse xs)

