module Aux (sumaNatural, multiNatural) where

import Tipos (Natural(..))

{-
    Función: sumaNatural
    Descripción: Suma dos números naturales.
    Uso: sumaNatural (S (S (Cero))) (S (Cero)) = sumaNatural (S (S (Cero))) (S (Cero))
-}

sumaNatural :: Natural -> Natural -> Natural
sumaNatural Cero n = n
sumaNatural (S m) n = sumaNatural m (S n)

{-
    Función: multiNatural
    Descripción: Multiplica dos números naturales
    Uso: multiNatural (S (S (S (Cero)))) (S (S (Cero))) = S (S (S (S (S (S Cero)))))


-}

multiNatural :: Natural -> Natural -> Natural
multiNatural Cero _ = Cero
multiNatural (S m) n = sumaNatural n (multiNatural m n)