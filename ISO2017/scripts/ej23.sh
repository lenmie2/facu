#!/bin/bash
#Implemente un script que recorra un arreglo compuesto por números e imprima en pantalla
#sólo los números pares y que cuente sólo los números impares y los informe en pantalla al
#finalizar el recorrido.

num=(10 3 5 7 9 3 5 4)
imp=0
echo "arreglo de numeros a analizar: ${num[*]}"
for (( i=0; i<${#num[@]}; i++ ))
do
        aux=$(expr ${num[$i]} % 2)
        if [ $aux == 0 ]
        then
		echo "${num[$i]} es par"
        else
		imp=$(expr $imp + 1)
        fi
done
echo "la cantidad de los impares es" $imp



