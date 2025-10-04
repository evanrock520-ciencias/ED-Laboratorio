data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

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
    Función:
    Descripción:
    Uso:
-}

{-
    Función:
    Descripción:
    Uso:
-}