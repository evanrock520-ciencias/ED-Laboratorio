# Práctica 6

## Objetivo

## Representaciones

### 1. Árboles Binarios

El siguiente árbol es de la sucesión de fibonacci.

``` mermaid
graph TB
    A((1))-->B((1))
    A((1))-->C((2))
    B((1))-->D((3))
    B((1))-->E((5))
    C((2))-->F((8))
    C((2))-->G((13))
    D((3))-->H((21))
    D((3))-->I((34))
    G((13))-->J((55))
```

El siguiente árbol es de los números primos

``` mermaid
graph TB
    A((1))-->B((2))
    A((1))-->C((3))
    B((2))-->D((5))
    C((3))-->E((7))
    D((5))-->F((11))
    D((5))-->G((13))
    E((7))-->H((17))
    E((7))-->I((23))
```

### 2. Árboles Binarios por representación

Representar como árboles en mermaid los siguientes árboles.

#### a) : AB 4 (Vacio ) (AB 3 Vacio Vacio )

``` mermaid
graph TB 
    A((4))-->B(( ))
    A((4))-->C((3))
    C((3))-->D(( ))
    C((3))-->E(( ))
```

#### b) : AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))

``` mermaid
graph TB 
    A((4))-->B(( ))
    A((4))-->C((3))
    C((3))-->D(( ))
    C((3))-->E((5))
    E((5))-->F(( ))
    E((5))-->G(( ))
```

#### c) : AB 3 (AB 7 (AB 12 Vacio Vacio) Vacio) (AB 6 (AB 11 Vacio Vacio) (AB 10 Vacio Vacio))

``` mermaid
graph TB 
    A((3))-->B((7))
    B((7))-->C((12))
    C((12))-->D(( ))
    C((12))-->E(( ))
    B((7))-->F(( ))
    A((3))-->G((6))
    G((6))-->H((11))
    H((11))-->I(( ))
    H((11))-->J(( ))
    G((6))-->K((10))
    K((10))-->L(( ))
    K((10))-->M(( ))
```

## Tiempo requerido

Para realizar esta pŕactica me tarde:

- 35 mins en los árboles con marmaid.
- 1 hora y 20 minutos haciendo las funciones.

Para un total de **1 hora 55 minutos**.

## Comentarios Extra

Me gusto la implementación del Mermaid para dibujar los árboles. Justo descubri una extension de VS CODE para mientras los hacia los visualizara.[ Extension: Markdown Preview Mermaid Support](https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid)

Las pruebas otra vez se me hicieron interesantes y bastante  oportunas. Creo que descubri como romper la circularidad sin crear un nuevo módulo (algo que no supe hacer en la práctica 4).

