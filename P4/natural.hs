data Natural = Cero | S Natural deriving (Eq, Show)

{-
    Función: a_natural
    Descripción: Toma un entero y lo transforma en Natural
    Uso: a_natural 2 = S (S (Cero))
-}

a_natural :: Int -> Natural
a_natural 0 = Cero
a_natural n = S (a_natural (n-1))


{-
    Función: a_entero
    Descripción: Toma un Natural y lo transforma en entero
    Uso: a_natural S (S (S (Cero))) = 3
-}

a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S m) = 1 + a_entero m

sumaNatural :: Natural -> Natural -> Natural
sumaNatural Cero n = n
sumaNatural (S m) n = sumaNatural m (S n)

multiNatural :: Natural -> Natural -> Natural
multiNatural Cero n = Cero
multiNatural (S m) n = sumaNatural n (multiNatural n m)

{-
    Función: potenciaNat
    Descripción: Eleva el primer número natural a la potencia del segundo
    Uso: potenciaNat (S (S (S (Cero)))) (S (S ((Cero))) = (S (S (S (S (S (S (S (S (S(Cero))))))))))
-}

potenciaNat :: Natural -> Natural -> Natural
potenciaNat _ Cero     = S Cero  
potenciaNat Cero _     = Cero           
potenciaNat m (S n)    = multiNatural m (potenciaNat m n)

{-
    Función: factNat
    Descripción: Eleva el primer número natural a la potencia del segundo
    Uso: factNat (S (S (S (Cero))) = (S (S (S (S (S (S (Cero)))))))
-}


factNat :: Natural -> Natural
factNat Cero = S Cero
factNat (S Cero) = S Cero
factNat (S m) = multiNatural (S m) (factNat m)


