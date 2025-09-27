module Aux (reversa) where

{-
    Función: reversa
    Descripción: Recibe una lista y devuelve sus elementos en reversa
    Uso: reversa "pollitoConPapas" = "sapaPnoCotillop"
-}

reversa :: [a] -> [a]
reversa [] = []
reversa (x:xs) = reversa xs ++ [x]


