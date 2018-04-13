# Manejo de argumentos de un programa

Este ejemplo muestra una forma en que se pueden manejar los argumentos que un programa reciba por línea de comandos.

## Caso de ejemplo

Se desea desarrollar una calculadora acotada que realice las funciones de suma, resta y multiplicación de números enteros con signo. El programa que implementa estas funciones recibirá por línea de comandos la operación a realizar y una lista de longitud indeterminada con los números enteros sobre los cuales operará (los *operandos*).

Las operaciones posibles, junto con los *flags* que las identifican (en versión corta y larga) son:

* Suma
  * Opción corta: `+`
  * Opción larga: `--add`
* Resta
  * Opción corta: `-`
  * Opción larga: `--sub`
* Multipplicación
  * Opción corta: `*`
  * Opción larga: `--mul`

El resto de los argumentos deben ser considerados como valores enteros con signo e ignorados en caso de no ser válidos.

> Nota: tener en cuenta que, en general, las shells utilizan el asterisco (`*`) como un caracter comodín (o *wildcard*), por lo que se lo deberá escapar entre comillas al invocar el programa resultante. Por ejemplo, asumiendo que `calc` es el binario del programa compilado: `./calc '*' 2 5 6`.

## Compilación

Ejecutar el comando `make`, esto resultará en la generación del ejecutable `calc` en este directorio.

```console
$ make
```

## Ejemplos de funcionamiento

Asumiendo que `calc` es el binario compilado del programa, los siguientes casos demuestran su invocación y funcionamiento:

### Suma

```console
$ ./calc --add 1 2 3 4 5 6 7 8 9 aaa
Sumando...
El resultado de la operación es: 45
```

```console
$ ./calc + 1 2 3 4 5 6 7 8 9 aaa
Sumando...
El resultado de la operación es: 45
```

Los ejemplos anteriores realizan la operación:

```
1 + 2 + 3 + 5 + 6 + 7 + 8 + 9 = 45
```

### Resta

```console
$ ./calc --sub 1 2 3 4 5 6 7 8 9 aaa
Restando...
El resultado de la operación es: -43
```

```console
$ ./calc - 1 2 3 4 5 6 7 8 9 aaa
Restando...
El resultado de la operación es: -43
```

Los ejemplos anteriores realizan la operación:

```
1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 = -43
```

### Multiplicación

```console
$ ./calc --mul 1 2 3 4 5 6 7 8 9 aaa
Multiplicando...
El resultado de la operación es: 362880
```

```console
$ ./calc '*' 1 2 3 4 5 6 7 8 9 aaa
Multiplicando...
El resultado de la operación es: 362880
```

Los ejemplos anteriores realizan la operación:

```
1 * 2 * 3 * 4 * 5 * 6 * 7 * 8 * 9 = 362880
```