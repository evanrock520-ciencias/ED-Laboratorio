module Aux(ordena) where

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
    descripción: Ordena una lista de mayor a menor.
    uso: ordena [7, 98, 65, 100, 54, 12, 1] = [100,98,65,54,12,7,1]
-}

ordena :: Ord a => [a] -> [a]
ordena [] = []
ordena (x:xs) = misterio x (ordena xs)