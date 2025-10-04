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
    Uso:
-}

minimo :: (Eq a) => (Ord a) => Arbol a -> a
minimo Vacio = error "El árbol vacío no tiene elementos"
minimo (AB r Vacio Vacio) = r
minimo (AB r t1 t2) 
    | r == minimo t1 || r == minimo t2 = r
    | r < minimo t1 && r < minimo t2 = r
    | minimo t1 < minimo t2 = minimo t1
    | minimo t2 < minimo t1 = minimo t2
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

{-
    Función:
    Descripción:
    Uso:
-}