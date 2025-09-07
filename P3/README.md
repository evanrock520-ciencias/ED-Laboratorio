# Práctica 3 - Estructuras Discretas

## Objetivo
El objetivo de esta práctica fue crear funciones que sirvieran para aterrizar conceptos vistos anteriormente en clase y en el laboratorio. 
Especificamente utilizar los conceptos de `Clases de tipo` y `Listas por comprensión`.
Además de también tentar el terreno para la recursión y aplicar commits semánticos como buenas prácticas de programación.

## Diferencia entre `Num` e `Int`

![Imágen de la Consola comparando Num e Int](https://github.com/evanrock520-ciencias/ED-Laboratorio/blob/main/P3/Images/NumInt.png)

**Int** es un tipo de dato concreto. Es decir que es un número entero con un rango fijo.
**Num** por su parte es una **clase de tipos** que puede representar todos los tipos de datos numéricos. 

### Ejemplo:
```haskell
ghci> :t 17
17 :: Num a => a

ghci> :t (17 :: Int)
(17 :: Int) :: Int

```


## Recursión First Steps

### Pollito Pío
[![Miniatura del video](https://img.youtube.com/vi/dhsy6epaJGs/0.jpg)](https://www.youtube.com/watch?v=dhsy6epaJGs)

La canción del **Pollito Pio** puede ilustrar de manera muy práctica y sencilla el concepto de la **recursión**. 

Para comenzar, contamos con un **caso base** (en este particular lo es el **Pollito**) que es el minimal de toda la canción y al que de alguna manera siempre se regresa.
Como el **el caso recursivo** tenemos la generación de los demás animales en los que cada uno está relacionado con el anterior. Si queremos llegar al *Perro* tenemos que pasar también por el *Gato* y la *Paloma*, de manera muy similar al concepto de generación de conjuntos recursivos de los naturales. 

También cumple una **condición de terminación**, el *Tractor* que aplasta al Pollito puede verse como el final del proceso recursivo.  

## Tiempo requerido
Contando hasta el momento el tiempo requerido para esta práctica ha sido de `1 hora y 15 minutos`. Solo falta por implementar la última función.  