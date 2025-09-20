# Práctica 4


## 🎯 Objetivo
El objetivo de está práctica fue el de aplicar los conceptos de las estructuras de datos y recursión con funciones en Haskell.

## 🧠  Descripciones
Las descripciones de las funciones de `natural.hs` 1️⃣.

#### 1. `a_natural :: Int -> Natural`

-   **Caso Base:** `a_natural 0 = Cero`. La representación del entero `0` es directamente el constructor `Cero`.
-   **Paso Recursivo:** `a_natural n = S (a_natural (n-1))`. Para cualquier entero mayor que 0, su representación como `Natural` es el sucesor (`S`) de la representación del natural anterior. La función se llama a sí misma con un problema más pequeño (`n-1`) hasta alcanzar el caso base y de esa manera obtener la representación natural de un entero.

#### 2. `a_entero :: Natural -> Int`

-   **Caso Base:** `a_entero Cero = 0`. La conversión inversa: el constructor `Cero` corresponde al entero `0`.
-   **Paso Recursivo:** `a_entero (S m) = 1 + a_entero m`. Para un `Natural` sucesor como `S m`, su valor entero es `1` más el valor entero de su natural anterior, aquí `m`. Descomponemos el `Natural` quitando un sucesor en cada llamada y nos quedamos con la suma que se obtenga.

#### 3. `potenciaNat :: Natural -> Natural -> Natural`

-   **Casos Base:**
    -   `potenciaNat _ Cero = S Cero`. Basado en la propiedad matemática de que `n^0 = 1`. Cualquier `Natural` elevado a `Cero` es `S Cero` (que es el equivalente a nuestro `1`).
    -   `potenciaNat Cero _ = Cero`. Porque conocemos que el número `Cero` elevado a cualquier potencia dentro los naturales diferentes de Cero es `Cero`.
-   **Paso Recursivo:** `potenciaNat m (S n) = multiNatural m (potenciaNat m n)`. Para este caso recursivo tenemos un número **m** invariante al que siempre lo multiplicamos por el mismo hasta que el segundo argumento **(S n)** sea igual a cero y llegué al caso base.

Esté ya lo habiamos hecho para la tarea 1.

#### 4. `facNat :: Natural -> Natural`

-   **Casos Base:**
    -   `facNat Cero = S Cero`. Por definición sabemos que el factorial de `0` es `1`.
    -   `facNat (S Cero) = S Cero`. El factorial de `1` también es `1`.
-   **Paso Recursivo:** `facNat (S m) = multiNatural (S m) (facNat m)`. El factorial de un número `n` está definido como `n * (n-1)!`. Por ese concepto, en cada paso, multiplicamos el número actual (`S m`) por el factorial del número anterior (`m`). Sabemos que en algún punto llegara al caso base y nos regresara el factorial total.

Las descripciones de las funciones `mati.hs` 🪆.

#### 1. `mayorIgual :: Matrioska -> Matrioska -> Bool`

-   **Casos Base:**
    -   `mayorIgual Mati Mati = True`. Si ambas son la matrioska más pequeña entonces deben ser iguales.
    -   `mayorIgual _ Mati = True`. Si la segunda matrioska ya es `Mati`, la primera es necesariamente mayor o igual.
    -   `mayorIgual Mati _ = False`. Si la primera es `Mati` y la segunda no (lo cual es cierto porque lo verficamos con los casos anteriores), entonces la primera es más pequeña.
-   **Paso Recursivo:** `mayorIgual (Cont m1) (Cont m2) = mayorIgual m1 m2`. Si ambas son contenedores de matrioskas, el problema se reduce a comparar las matrioskas que contiene cada una, quitando el contenedor. De está manera alguna de las dos o ambas siempre llegaran a ser `Mati`

#### 2. `aplana :: Matrioska -> [Matrioska]`

-   **Caso Base:** `aplana Mati = [Mati]`. La versión aplanada de la matrioska más simple es una lista que solo la contiene a ella.
-   **Paso Recursivo:** `aplana (Cont m) = (Cont m) : aplana m`. Para una matrioska en un contenedor `(Cont m)`, la lista aplanada se construye tomando la matrioska actual (`Cont m`) y añadiéndola al principio de la lista que obtenemos al aplanar la matrioska que está dentro (`m`).

## ⏱️ Tiempo requerido

Llevo aproximadamente `2 horas y media`.

## Comentario Extra

Quiero expresar que la realización de está práctica no fue muy complicada porque prácticamente ya habiamos visto todo en clase con Rafita.

Lo que más me costo fue llevar las funciones de `sumaNatural` y `multiNatural` al archivo `Aux.hs` debido a los problemas de circularidad. 
Por eso cree el archivo Tipos.hs para guardar el tipo de dato **Natural** para usarlo en ambos archivos `natural.hs` y `Aux.hs`.