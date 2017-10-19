#!/bin/bash
#Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*, %. 
#Esta calculadora debe funcionar recibiendo la operación y los números como parámetros

if [ $# -ne 3 ]
then
	echo "cantidad de parametros incorrecta"
else
	case $2 in
	"%")
		echo  $(expr $1 / $3)	
	;;
	"-")
		echo  $(expr $1 - $3)
	;;
	"+")
		echo $(expr $1 + $3)
	;;
	"*")
		echo $(expr $1 \* $3)
	esac
fi

