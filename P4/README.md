# Práctica 4


## 🎯 Objetivo
El objetivo de está práctica fue el de aplicar los conceptos de las estructuras de datos y recursión con funciones en Haskell.

## 🧠  Descripciones
Las descripciones de las funciones de `natural.hs` 1️⃣.

#### 1. `a_natural :: Int -> Natural`

-   **Caso Base:** `a_natural 0 = Cero`. La representación del entero `0` es directamente el constructor `Cero`. La cual es la terminación natural de la recursión.
-   **Paso Recursivo:** `a_natural n = S (a_natural (n-1))`. Para cualquier entero `n > 0`, su representación como `Natural` es el sucesor (`S`) de la representación de `n-1`. La función se llama a sí misma con un problema más pequeño (`n-1`) hasta alcanzar el caso base.

#### 2. `a_entero :: Natural -> Int`

-   **Caso Base:** `a_entero Cero = 0`. La conversión inversa: el constructor `Cero` corresponde al entero `0`.
-   **Paso Recursivo:** `a_entero (S m) = 1 + a_entero m`. Para un `Natural` sucesor `S m`, su valor entero es `1` más el valor entero de su predecesor `m`. Descomponemos el `Natural` "quitando" un sucesor en cada llamada.

#### 3. `potenciaNat :: Natural -> Natural -> Natural`

-   **Casos Base:**
    -   `potenciaNat _ Cero = S Cero`. Basado en la propiedad matemática `n^0 = 1`. Cualquier `Natural` elevado a `Cero` es `S Cero` (equivalente a nuestro `1`).
    -   `potenciaNat Cero _ = Cero`. El `Cero` elevado a cualquier potencia en los naturales diferentes de Cero es `Cero`.
-   **Paso Recursivo:** `potenciaNat m (S n) = multiNatural m (potenciaNat m n)`. Para este caso recursivo tenemos un número **m** invariante al que siempre lo multiplicamos por el mismo hasta que el segundo argumento **(S n)** sea igual a cero y llegué al caso base.

#### 4. `facNat :: Natural -> Natural`

-   **Casos Base:**
    -   `facNat Cero = S Cero`. Por definición, el factorial de `0` es `1`.
    -   `facNat (S Cero) = S Cero`. El factorial de `1` también es `1`.
-   **Paso Recursivo:** `facNat (S m) = multiNatural (S m) (facNat m)`. El factorial de un número `n` se define como `n * (n-1)!`. En cada paso, multiplicamos el número actual (`S m`) por el factorial del número anterior (`m`).

Las descripciones de las funciones `mati.hs` 🪆.

#### 1. `mayorIgual :: Matrioska -> Matrioska -> Bool`

-   **Casos Base:**
    -   `mayorIgual Mati Mati = True`. Si ambas son la matrioska más pequeña, son iguales.
    -   `mayorIgual _ Mati = True`. Si la segunda matrioska ya es `Mati`, la primera es necesariamente mayor o igual.
    -   `mayorIgual Mati _ = False`. Si la primera es `Mati` y la segunda no (lo cual es cierto porque lo verficamos con los casos anteriores), entonces la primera es más pequeña.
-   **Paso Recursivo:** `mayorIgual (Cont m1) (Cont m2) = mayorIgual m1 m2`. Si ambas son contenedores de matrioskas, el problema se reduce a comparar las matrioskas que contienen quitando el contenedor.

#### 2. `aplana :: Matrioska -> [Matrioska]`

-   **Caso Base:** `aplana Mati = [Mati]`. La versión aplanada de la matrioska más simple es una lista que solo la contiene a ella.
-   **Paso Recursivo:** `aplana (Cont m) = (Cont m) : aplana m`. Para una matrioska en un contenedor `(Cont m)`, la lista aplanada se construye tomando la matrioska actual (`Cont m`) y añadiéndola al principio (`:`) de la lista que obtenemos al aplanar la matrioska de dentro (`m`).

## ⏱️ Tiempo requerido

Llevo aproximadamente `1 hora y media`.

## Comentario Extra

Aún no se como llevar las funciones **sumaNat** y **multiNat** hacia `Aux.hs`.
También quiero expresar que la realización no fue muy complicada porque prácticamente ya habiamos visto todo en clase con Rafita.