module Aux(ordena, Dict(..)) where

-- Definiciones
data Dict = Nada |Dict Int Char deriving (Eq, Ord, Show)

{-
    función: misterio
    descripción: Añade un elemento de manera ordena a una lista ordenada de mayor a menor.
    uso: misterio 7 [9,8,6,5] = [9,8,7,6,5]
-}

misterio :: Ord t => t -> [t] -> [t]
misterio x [] = [x]
misterio n (x:xs) = if n >= x then n : (x:xs) else x : misterio n xs

{-
    función: ordena
    descripción: Ordena una lista de Dict de mayor a menor orden.
    uso: ordena [Dict 2 'a', Dict 3 'z', Dict 1 'c'] = [Dict 3 'z',Dict 2 'a',Dict 1 'c']
-}

ordena :: [Dict] -> [Dict]
ordena [] = []
ordena (d:xs) = misterio d (ordena xs)