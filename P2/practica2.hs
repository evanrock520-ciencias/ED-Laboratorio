-- Práctica 2 : Creación de funciones en Haskell

{-
    Función: sayHello
    Descripción: Recibe una cadena y le concatena "Hello, " al inicio.
    Uso: sayHello "my friend" = "Hello, my friend"
-}

sayHello :: String -> String
sayHello x = "Hello, " ++ x

{-
    Función: calcularPropina
    Descripción: Calcula la propina a partir de una cuenta. 
                 Por defecto se deja el 10% del total.
    Uso: calcularPropina 1200 = 120.0
-}

calcularPropina :: Float -> Float
calcularPropina x = (x*10)/100

{-
    Función: menor
    Descripción: Recibe tres enteros y devuelve el menor de ellos.
    Uso: menor 12 8 9 = 8
-}

menor :: Int -> Int -> Int -> Int
menor x y z =
    if x <= y && x <= z then x
    else if y <= z then y
    else z

{-
    Función: decide
    Descripción: Recibe un valor booleano y dos cadenas. 
                 Si el booleano es True devuelve la primera cadena,
                 de lo contrario devuelve la segunda.
    Uso: decide True "sopa" "de papa" = "sopa"
-}


decide ::  Bool -> String -> String -> String
decide x y z =
    if x == True
        then y
        else z

{-
    Función: esDescendiente
    Descripción: Recibe cuatro enteros y devuelve True si están en 
                 orden estrictamente descendente, de lo contrario devuelve False.
    Uso: esDescendiente 4 3 2 1 = True
-}

esDescendiente :: Int -> Int -> Int -> Int -> Bool
esDescendiente a b c d =
    if a > b && b > c && c > d
        then True
        else False

{-
    Función: esDivisible
    Descripción: Recibe dos enteros x e y. Devuelve una cadena que indica 
                 si x es divisible entre y. En caso de que y sea 0 devuelve un mensaje de error.
    Uso: esDivisible 6 3 = "6 es divisible entre 3"
-}

esDivisible :: Int -> Int -> String
esDivisible x y =
    if y /= 0
        then show (x) ++ " es divisible entre " ++ show (y)
        else "No se puede dividir entre 0"

{-
    Función: hipotenusa
    Descripción: Calcula la hipotenusa de un triángulo rectángulo a partir de sus catetos.
    Uso: hipotenusa 3 4 = 5.0
-}

hipotenusa :: Float -> Float -> Float
hipotenusa x y = sqrt ((x ** 2) + (y ** 2))

{-
    Función: pendiente
    Descripción: Calcula la pendiente de la recta que pasa por dos puntos (x1, y1) y (x2, y2).
    Uso: pendiente (1,2) (3,6) = 2.0
-}

pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x1,y1) (x2,y2) = (y2 - y1) / (x2 - x1)

{-
    Función: distanciaPuntos
    Descripción: Calcula la distancia entre dos puntos en el plano (x1, y1) y (x2, y2).
    Uso: distanciaPuntos (1,2) (4,6) = 5.0
-}

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt (((x2 - x1) ** 2) + ((y2 - y1) ** 2))

{-
    Función: cuadrados
    Descripción: Toma una lista de valores enteros y retorna la lista con las potencias de esos enteros
    Uso: cuadrados [1, 4, 8] = [1, 16, 64] 
-}


cuadrados :: [Int] -> [Int]
cuadrados xs = [x*x | x <- xs]