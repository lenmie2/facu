#!/bin/bash
#Escriba un script que reciba una cantidad desconocida de parámetros al momento de su 
#invocación (debe validar que al menos se reciba uno). Cada parámetro representa la ruta absoluta
#de un archivo o directorio en el sistema. El script deberá iterar por todos los parámetros 
#recibidos, y solo para aquellos parámetros que se encuentren en posiciones impares 
#verificar si el archivo o directorio existen en el sistema, imprimiendo en pantalla que tipo
#de objeto es (archivo o directorio). Además, deberá informar la cantidad de archivos o
#directorios inexistentes en el sistema.

if [ $# -ge 1 ]
then
	noexist=0
	arreglo=($*)
	count=0

	for each in ${arreglo[*]}
	do
		let count++
		if [ $(expr $count % 2) -ne 0 ]
		then
			if [ -d $each ]
			then
				echo "$each es un directorio"
			elif [ -f $each ]
			then
				echo "$each es un archivo regular"
			else
				let noexist++
			fi
		fi
	done
	echo "cantidad de direcciones que no existen es $noexist"

else
	echo "error, cantidad de parametros incorrecta"
	exit 1
fi

