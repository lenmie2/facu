#!/bin/bash
#Dada la siguiente declaración al comienzo de un script: num=(10 3 5 7 9 3 5 4) (la cantidad
#de elementos del arreglo puede variar). Implemente la función productoria dentro de este
#script, cuya tarea sea multiplicar todos los números del arreglo
num=(10 3 5 7 9 3 5 4)
result=1
for (( i = 0; i < ${#num[*]} ; i++ ))
do
	result=$(expr $result \* ${num[$i]})
done
echo $result

