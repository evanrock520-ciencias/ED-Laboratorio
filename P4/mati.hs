data Matrioska = Mati | Cont Matrioska deriving(Eq, Show) 

{-
    Función: mayorIgual
    Descripción: Compara si la primer matrioska es mayor o igual que la segunda.
    Uso: mayorIgual (Cont (Cont (Mati))) (Cont (Cont (Mati))) = True
-}

mayorIgual :: Matrioska -> Matrioska -> Bool
mayorIgual Mati Mati = True
mayorIgual _ Mati = True
mayorIgual Mati _ = False
mayorIgual (Cont m) (Cont n) = mayorIgual m n

{-
    Función: aplana
    Descripción: Convierte una matrioska anidada en una lista plana de todas las matrioskas que la componen
    Uso: aplana aplana ( Cont ( Cont Mati ) ) = [ Cont ( Cont Mati ) , Cont Mati Mati ]
-}

aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana (Cont m) = (Cont m) : aplana m