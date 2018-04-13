# Ejemplos del Seminario de Lenguajes - Opción C

Este repositorio contiene algunos ejemplos puntuales para distintos temas vistos en la materia Seminario de Lenguajes - Opción C, de la [Facultad de Informática](http://www.info.unlp.edu.ar) de la [Universidad Nacional de La Plata](http://unlp.edu.ar).

## Organización

Los ejemplos están organizados en directorios individuales, siendo los siguientes los temas que cada uno trata:

* `args`: manejo de argumentos de un programa en C.
* `args_fptr`: versión idéntica a `args`, que utiliza punteros a funciones para evitar repetición innecesaria de código.

## ¿Cómo utilizar estos ejemplos?

Se puede analizar el código fuente incluido en cada directorio, y compilarlo mediante el comando `make` para obtener el binario resultante. Por ejemplo, para compilar el ejemplo `args` se deben realizar los siguientes pasos en una interfaz de línea de comandos (o consola):

```console
$ git clone https://gitlab.com/catedra_c/ejemplos.git ejemplos_c
$ cd ejemplos_c/args
$ make
```

Eso resultará en la generación de un ejecutable en el mismo directorio `args`.

En cada ejemplo incluimos un archivo `README` que lo describe para simplificar su interpretación.