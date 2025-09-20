module Tipos (Natural(..)) where

-- Tipo de dato en este archivo para evitar
-- problemas de circularidad

data Natural = Cero | S Natural deriving (Eq, Show)