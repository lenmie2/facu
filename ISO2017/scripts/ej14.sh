#!/bin/bash
#Renombrando Archivos: haga un script que renombre solo archivos de un directorio pasado
#como parametro agregandole una CADENA, contemplando las opciones:
#“-a CADENA”: renombra el fichero concatenando CADENA al final del nombre del archivo
#“-b CADENA”: renombra el fichero concantenado CADENA al principio del nombre del archivo
if [ $# -ne 3 ]
then
	echo "no se mandaron bien los parametros"
	exit 1
elif [ ! -d $1 ]
then
	echo "archivo no es un directorio"
	exit 1
else
	case $2 in
		"-a" )
			for archivo in $(ls $1)
			do
			 	 mv $1/$archivo $1/$archivo$3
			done
		;;
		"-b" )
			for archivo in $(ls $1)
                        do
                           	 mv $1/$archivo $1/$3$archivo
                        done
		esac
fi
exit 0
