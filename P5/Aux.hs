module Aux (reversa) where

{-
    Función:
    Descripción:
    Uso:
-}

reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]


