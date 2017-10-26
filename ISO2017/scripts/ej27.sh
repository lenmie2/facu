#!/bin/bash
#Realice un script que implemente a través de la utilización de funciones las operaciones
#básicas sobre arreglos:
#	inicializar: Crea un arreglo llamado array vacío
#	agregar_elem <parametro1>: Agrega al final del arreglo el parámetro recibido
#	eliminar_elem <parametro1>: Elimina del arreglo el elemento que se encuentra en la
#		posición recibida como parámetro. Debe validar que se reciba una posición válida
#	longitud: Imprime la longitud del arreglo en pantalla
#	imprimir: Imprime todos los elementos del arreglo en pantalla
#		inicializar_Con_Valores <parametro1><parametro2>: Crea un arreglo con longitud
#	<parametro1>y en todas las posiciones asigna el valor <parametro2>
inicializar(){
	array=()
	echo "array inicializado"

}
agregar_elem(){

	array=( ${array[*]} $1 )


}
eliminar_elem(){

	if [ $1 -lt ${#array[*]} ]
	then
		echo "se eliminara elemento ${array[$1]}"
		unset array[$1]
	else
		echo "error, posicion no existente"
		return 1
	fi

}
longitud(){
	
	echo "la longitud del arreglo es ${#array[*]}"

}
imprimir(){

	for each in ${array[*]}	
	do
		echo $each		
	done

}

select each in inicializar agregar_elem eliminar_elem longitud imprimir salir
do
	case $each in
	"inicializar")
		inicializar
	;;
	"agregar_elem")
		
		echo "ingrese elemento a agregar"
		read par			
		agregar_elem $par
	;;
	"eliminar_elem")
		echo "ingrese elemento a eliminar"
		read par
		eliminar_elem $par
		if [ $? -ne 0 ]
		then
			exit 1
		fi
	;;
	"longitud")
		longitud
	;;
	"imprimir")
		imprimir
	;;
	"salir")
		exit 0
	;;
	esac
done
