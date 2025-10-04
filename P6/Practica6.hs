import Aux(listaArbolReversa, inserta, altura, Arbol(Vacio, AB))

{-
    Función: nVacios
    Descripción: Devuelve el total de nodos vacios en un árbol
    Uso: 
-}

nVacios :: Arbol a -> Int
nVacios Vacio = 1
nVacios (AB r t1 t2) = nVacios t1 + nVacios t2

{-
    Función: refleja
    Descripción: Hace que los subárboles izquierdos se vuelvan
    subárboles derechos y viceversa.
    Uso:
-}

refleja :: Arbol a -> Arbol a
refleja Vacio = Vacio
refleja (AB r t1 t2) = AB r (refleja t2) (refleja t1)

{-
    Función: minimo
    Descripción: Devuelve el elemento mínimo de un árbol.
    Uso: minimo (AB 2 (AB 10 Vacio Vacio) (AB 1 Vacio Vacio)) = 1
-}

minimo :: (Eq a) => (Ord a) => Arbol a -> a
minimo Vacio = error "El árbol vacío no tiene elementos"
minimo (AB r Vacio Vacio) = r
minimo (AB r t1 t2) 
    | r <= minimo t1 && r <= minimo t2 = r
    | minimo t1 < minimo t2 = minimo t1
    | minimo t2 < minimo t1 = minimo t2

{-
    Función: recorrido
    Descripción: Regresa una lista del árbol con el recorrido inOrden.
    Uso: recorrido ( AB 4 Vacio ( AB 1 (AB 8 (AB 12 Vacio Vacio) Vacio ) ( AB 10 Vacio Vacio ) ) ) = [4,12,8,1,10]
-}

recorrido :: Arbol a -> [a]
recorrido Vacio = []
recorrido (AB r t1 t2) = recorrido t1 ++ [r] ++ recorrido t2

{-
    Función: esBalanceado
    Descripción: Verifica si un árbol está balanceado.
    Uso: balanceado (AB 1 (AB 2 Vacio Vacio) (AB 3 (AB 6 Vacio Vacio) Vacio)) = True
-}

balanceado :: Arbol a -> Bool
balanceado Vacio = True
balanceado (AB r t1 t2) = abs (altura t1 - altura t2) <= 1 && balanceado t1 && balanceado t2

{-
    Función: listaArbol
    Descripción: Recibe una lista de elementos y regresa un árbol binario
    de búsqueda
    Uso:
-}

listaArbol :: (Ord a) => [a] -> Arbol a
listaArbol [] = Vacio
listaArbol xs = listaArbolReversa(reverse xs)

