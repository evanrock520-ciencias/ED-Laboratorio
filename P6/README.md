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
    B((7))-->F((6))
    F((6))-->G((11))
    G((11))-->H(( ))
    G((11))-->I(( ))
    A((3))-->J((10))
    J((10))-->K(( ))
    J((10))-->L(( ))
```

## Tiempo requerido

## Comentarios Extra