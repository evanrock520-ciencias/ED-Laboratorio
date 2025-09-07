-- Creación del tipo de dato Materia
data Materia = Materia String Int deriving (Show)

-- Declaración de cada materia
ed = Materia "Estructuras Discretas" 12
icc = Materia "Introduccion a las Ciencias de la Computacion" 12
as = Materia "Algebra Superior I" 10
mca = Materia "Matematicas para las Ciencias Aplicadas I" 12
ingles = Materia "Ingles I" 4

-- Lista de materias
materias :: [Materia]
materias = [ed, icc, as, mca, ingles]

{-
    Función: nombre
    Descripción: Devuelve el nombre de una materia
    Uso: nombre ed ==> "Estructuras Discretas"
-}

nombre :: Materia -> String
nombre (Materia n _) = n

{-
    Función: creditos
    Descripción: Dado un número de créditos, devuelve una lista con las materias que 
    tienen exactamente esa cantidad de créditos.
    Uso: creditos 4 = ["Ingles I"]
-}

creditos :: Int -> [String]
creditos n = [nombre m | m@(Materia _ c) <- materias, c == n]

{-
    Función: negativos
    Descripción: Cuenta los números negativos de una lista.
    Uso: negativos [12, 5, -1, -7, -9] = 3
-}

negativos :: [Int] -> Int
negativos xs = length [x | x <- xs, x < 0]

{-
    Función: primos
    Descripción: Devuelve los números primos de una lista.
    Uso: primos [8, 7, 17, 4] = [7, 17]
-}

primos :: [Int] -> [Int]
primos xs = [x | x <- xs, x > 1, null [n | n <- [2..(x `div` 2)], x `mod` n == 0]]

{-
    Función: conjuntoListas
    Descripción: Devuelve una lista sin elementos repetidos
    Uso: conjuntoListas [1, 4, 1, 8, 4, 0] = [1, 4, 8, 0]
-}

conjuntoListas :: [Int] -> [Int]
conjuntoListas xs = 
    

encontrarNumero :: Int -> [Int] -> Int
encontrarNumero n xs = 
    if  

