module Aux (sumaNatural, multiNatural) where

import Tipos (Natural(..))

sumaNatural :: Natural -> Natural -> Natural
sumaNatural Cero n = n
sumaNatural (S m) n = sumaNatural m (S n)

multiNatural :: Natural -> Natural -> Natural
multiNatural Cero _ = Cero
multiNatural (S m) n = sumaNatural n (multiNatural m n)