# Codificación de Huffman

## Objetivo

Realizar la implementación de compresión de archivos de Huffman.

Codificar y decodificar archivos de texto a partir de árboles de Huffman.

## Funcionamiento

El programa analiza la frecuencia de aparición de cada carácter en una cadena de texto, construye un árbol de Huffman y genera una codificación binaria única para cada símbolo.
Posteriormente, es posible revertir el proceso (decodificación) utilizando el árbol original.

## Ejecución

Lo primero que se debe hacer para cifrar o descifrar una cadena de texto con este programa es abir el intérprete de Haskell.
En este caso podemos usar **GHCI** en la carpeta raíz del proyecto.

``` bash
ghci Proyecto.hs
```

Debe de aparecer lo siguiente para comprobar una correcta compilación.

``` bash
GHCi, version 9.6.7: https://www.haskell.org/ghc/  :? for help
[1 of 3] Compiling Aux              ( Aux.hs, interpreted )
[2 of 3] Compiling Main             ( Proyecto.hs, interpreted )
Ok, two modules loaded.
ghci> 
```

### Cifrar

Para cifrar una cadena de texto se debe realizar lo siguiente:

1. Definimos la frase que queremos cifrar.

``` bash
ghci> p = "calabaza endemoniada del demonio"
```

2. Usamos la función **usarCifrado** para obtener la cadena comprimida de nuestro mensaje.

```bash
ghci> c = usarCifrado p
ghci> c
"00000000001100000001100000000000110000000001100000101000010010100000010001000010000000011001100000100101000000010000010010100000010001000010000000010001"
```

### Descifrar

Para descifrar una cadena de texto vamos a necesitar la cadena binaria y el árbol asociado a la cadena sin cifrado. Para este ejemplo vamos a usar la frase que ya definimos y creando su árbol correspondiente.

1. Creamos el árbol original.

```bash
ghci> a = creaArbol p
ghci> a
Arbol '\t' (Arbol '\t' (Arbol '\t' (Arbol '\t' (Arbol '\t' (Arbol '\t' (Arbol '\t' (Arbol '\t' (Arbol '\t' (Arbol '\t' (Arbol '\t' (Arbol '\t' Vacio (Arbol 'b' Vacio Vacio)) (Arbol 'c' Vacio Vacio)) (Arbol 'z' Vacio Vacio)) (Arbol 'i' Vacio Vacio)) (Arbol 'l' Vacio Vacio)) (Arbol 'm' Vacio Vacio)) (Arbol ' ' Vacio Vacio)) (Arbol 'n' Vacio Vacio)) (Arbol 'o' Vacio Vacio)) (Arbol 'd' Vacio Vacio)) (Arbol 'e' Vacio Vacio)) (Arbol 'a' Vacio Vacio)
```

Podemos observar su visualización con Mermaid de la siguiente manera:

```mermaid
graph TD
    B["'\t'"]
    B --> C["'\t'"]
    C --> D["'\t'"]
    D --> E["'\t'"]
    E --> F["'\t'"]
    F --> G["'\t'"]
    G --> H["'\t'"]
    H --> I["'\t'"]
    I --> J["'\t'"]
    J --> K["'\t'"]
    K --> L["'\t'"]
    L --> M["'\t'"]
    M --> P["\t"]
    M --> b["'b'"]
    L --> c["'c'"]
    K --> z["'z'"]
    J --> i["'i'"]
    I --> l["'l'"]
    H --> m["'m'"]
    G --> s["' '"]
    F --> n["'n'"]
    E --> o["'o'"]
    D --> d["'d'"]
    C --> e["'e'"]
    B --> a["'a'"]

```

2. Ahora para decodificar la cadena binaria. Hacemos lo siguiente:

```bash
ghci> descifrar c a
"calabaza endemoniada del demonio"
```

Y tenemos el mensaje descifrado de nuevo.

## Tiempo Requerido

- Frecuencias de carácteres: 25 minutos
- Crear árbol de Huffman: 30 minutos.
- Codificar: 45 minutos.
- Decodificar: 30 minutos

## Comentarios Extra
