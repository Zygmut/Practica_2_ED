# Estructures de dades

### Curs 2020-2021

#### Práctica 2 - Códigos de Huffman

Esta práctica consiste en implementar la **codificación Huffman**. La
entrega constará de una carpeta comprimida que contendrá el proyecto GPS
con el código fuente (en caso de no disponer de proyecto GPS, debe entregarse
una carpeta comprimida con los ficheros .ads y .adb).

## 1 Introducción codificación Huffman

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


## 2 Estructuras necesarias

- Mapping implementado con un array (tabla de frecuencias).
- Arbol binario.
- Heap.


## Cronograma

Las tareas a implementar se encuentran distribuidas durante cuatro semanas:

- Semana 12/04/2021-18/04/2021: Construcción de la tabla de frecuen-
    cias a partir del texto contenido en el archivoentrada.txt.
- Semana 19/04/2021-25/04/2021: Creación de la cola de prioridad a
    partir de los ́arboles binarios de un solo nodo.
- Semana 26/04/2021-02/05/2021: Creación del árbol Huffman.
- Semana 03/05/2021-09/05/2021: Codificación a partir del árbol de
    Huffman.


