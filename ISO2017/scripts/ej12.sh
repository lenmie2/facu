#!/bin/bash
#Realizar un script que le solicite al usuario 2 números, los lea de la entrada Standard
#e imprima la multiplicación, suma, resta y cual es el mayor de los números leídos.

echo "ingrese un numero"
read num
echo "ingrese otro numero"
read mun
echo "la suma de los numeros es" $(expr $num + $mun)
echo "la multiplicacion de los numeros es" $(expr $num \* $mun)
echo "la division de los numeros es" $(expr $num / $mun)
echo "la resta de los numeros es" $(expr $num - $mun)
if [ $num -gt $mun ]
then
	echo "el mayor es " $num
else
	echo "el mayor es " $mun
fi
