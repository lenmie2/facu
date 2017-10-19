#!/bin/bash
#Modificar el script creado en el inciso anterior para que los números sean recibidos
#como parámetros. El script debe controlar que los dos parámetros sean enviados.
if [ $# -ne 2 ]
then
	echo "cantidad de parametros incorrecta"
else
	echo "la suma de los numeros es" $(expr $1 + $2)
	echo "la multiplicacion de los numeros es" $(expr $1 \* $2)
	echo "la division de los numeros es" $(expr $1 / $2)
	echo "la resta de los numeros es" $(expr $1 - $2)
	if [ $1 -gt $2 ]
	then
		echo "el mayor es " $1
	else
		echo "el mayor es " $2
	fi
fi
