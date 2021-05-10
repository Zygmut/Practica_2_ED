# Estructures de dades

### Curs 2020-2021

## Práctica 2 - Códigos de Huffman

Esta práctica consiste en implementar la **codificación Huffman**. La
entrega constará de una carpeta comprimida que contendrá el proyecto GPS
con el código fuente (en caso de no disponer de proyecto GPS, debe entregarse
una carpeta comprimida con los ficheros .ads y .adb).

### 1 Introducción codificación Huffman

La codificación Huffman es un algoritmo utilizado para la compresión de
datos. El término se refiere al uso de una tabla de códigos de longitud
variable para codificar un determinado símbolo (como puede ser un carácter
en un archivo), donde la tabla ha sido rellenada basándose en la probabilidad
estimada de aparición de cada posible valor de este símbolo.
La codificación Huffman utiliza un método específico para elegir la representación
de cada símbolo que da lugar a un código prefijo (es decir, la
cadena de bits que representa un símbolo en particular nunca es prefijo de
la cadena de bits de un símbolo diferente), el cual representa los caracteres
más comunes utilizando las cadenas de bits más cortas.


### 2 Estructuras necesarias

- Mapping implementado con un array (tabla de frecuencias).
- Arbol binario.
- Heap.


### Cronograma

Las tareas a implementar se encuentran distribuidas durante cuatro semanas:

- Semana 12/04/2021-18/04/2021: Construcción de la tabla de frecuen-
    cias a partir del texto contenido en el archivoentrada.txt.
- Semana 19/04/2021-25/04/2021: Creación de la cola de prioridad a
    partir de los ́arboles binarios de un solo nodo.
- Semana 26/04/2021-02/05/2021: Creación del árbol Huffman.
- Semana 03/05/2021-09/05/2021: Codificación a partir del árbol de
    Huffman.
    
## Práctica 3 - Trenes de carga

Esta práctica consiste en eimplementar una estructura de datos que nos ayude a resolver el problema presentado en este enunciado: geestión de trenes de carga. Para ello, se nos proporcionarán las implementaciones de los TAD vistos en la teoría para facilitar su diseño

### Enunciado del problema
Se tiene que diseñar una estructua de datos para gestionar trenes de carga de mercancía.

Un tren se compone de una locomotora y una serie de vagones preparados para el transporte de la carga. Tanto las locomotoras como los bagones son individuales y se montan los trenes según las necesidades. Se necesita gestionar un conjunto _n_ **muy grande**.

Montar un tren implica seleccionar una locomotora de entre las locomotoras libres ( no asignadas a ningún tren ) y un conjunto _x_ de vagones ( tambien entre los vagones libres ).

Las locomotoras se encuentrar identificadas mediante un código alpfanumérico de 8 caracteres que empieza siempre por L. Las locomotoras libres se encuentran aparcadas en una vía de la estación de sentido único: de modo que las locomotiras se aparcan alginal de la fila de locomotoras aparacadas y se desaparcan por el plrincipio de la vía

Los vagones se encuentran identificados mediante un código alfanumérico de 8 caracteres que empieza siempre por V y, además, debe almacenarse el peso máximo de carga que puede transportar cada uno. Los vagones libres se encuentran aparacados en una vía de la estación de deobre sentido que finaliza en uan de las paredes de la estación: de modo que los vagones se aparacan en sentido hacia la pared y se desaparcan en sentido contrario.

Cuando se monta un tren, los vagoens siempre se enganchan inmediatamente detrás de la locomotora. Para desmantelar un tren, os vagones también se desenganchan empezando por el primer vagón ( El vaǵon que se encuentra inmediatamente detrás de la locomotora )

### Overleaf documentación (read-only)
https://www.overleaf.com/read/zvgmzwwvygrq
