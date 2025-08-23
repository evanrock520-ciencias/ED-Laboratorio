-- Práctica 2 : Creación de funciones en Haskell

{-
    Función: Es un función que regresará una cadena concatenada a "Hello, "
    Descripción: Concatena una cadena que mandamos a "Hello, "
    Uso: "Hello, my friend"
-}

sayHello :: String -> String
sayHello x = "Hello, " ++ x

calcularPropina :: Float -> Float
calcularPropina x = (x*10)/100

menor :: Int -> Int -> Int -> Int
menor x y z = 
    if x > y && x > z
        then x
    else 
        if y > z
            then y
            else 
                if z > x
                    then x
                    else z

decide ::  Bool -> String -> String -> String
decide x y z = 
    if x == True
        then y
        else z

esDescendiente :: Int -> Int -> Int -> Int -> Bool
esDescendiente a b c d = 
    if a > b && b > c && c > d
        then True
        else False

esDivisible :: Int -> Int -> String
esDivisible x y =
    if y /= 0
        then show(x) ++ " es divisible entre " ++ show(y)
        else "No se puede dividir entre 0"

hipotenusa :: Float -> Float -> Float
hipotenusa x y = sqrt((x ** 2) + (y ** 2))

pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x1,y1) (x2,y2) = (y2 - y1) / (x2 - x1)

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x1, y1) (x2, y2) = sqrt(((x2 - x1) ** 2) + ((y2 - y1) ** 2))
