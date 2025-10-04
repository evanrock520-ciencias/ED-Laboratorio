module Aux(altura, Arbol(Vacio, AB)) where

data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

altura :: Arbol a -> Int
altura Vacio = 0
altura (AB r Vacio Vacio) = 1
altura (AB r t1 t2) = 1 + max (altura t1) (altura t2)