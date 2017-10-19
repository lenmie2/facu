#!/bin/bash
#Crear un script que verifique cada 10 segundos si un usuario se ha loqueado en el sistema
#(el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee,
#el programa deberá mostrar el mensaje ”Usuario XXX logueado en el sistema” y salir.

if [ $# -ne 1 ]
then
	echo "no se mandaron bien los parametros"
	exit 1
else
	while true
	do
		echo "buscando usuario"

		if [ "$1" == "$(who |cut -d" " -f1|grep $1)" ]
		then
			echo "Usuario $1 logueado en el sistema"
			break
		fi
		sleep 10
	done
fi
