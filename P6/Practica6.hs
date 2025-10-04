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