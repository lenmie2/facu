#!/bin/bash
#Realice un script que reciba como parámetro el nombre de un directorio. Deberá validar que
#el mismo exista y de no existir causar la terminación del script con código de error 4. Si el
#directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
#para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar
#dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y
#tampoco deberán ser tenidos en cuenta para la suma a informar.

if [ $# -eq 0 ] #si no recibi ningun parametro
then
	echo "Error. Debe ingresar al menos un parametro"
	exit 1
else
	if [ -d $1 ] #si el parametro existe y es un directorio
	then
		for elem in $(ls $1)
		do
			if [ -f $elem ] #si el elemento del directorio es un archivo regular
			then
				permiso=$(ls -l $elem | grep $USER | cut -c 2-4)
				if [ $? -eq 0 ] #si la ejecucion del comando anterior fue exitosa
				then 
					if [ $permiso == "rw-" ] #si el permiso es de lectura y escritura
					then
						echo "El usuario $USER tiene permiso de lectura y escritura para el archivo $elem"
						conpermisos=$(expr $conpermisos + 1)
					fi #fin si el permiso es lectura y escritura
				fi
			fi #fin si el elemento es un arch regular
		done
	else
		echo "Error. El parametro recibido no es un directorio"
		exit 4
	fi #fin si el parametro es un directorio
fi #fin si la cantidad de parametros es 0
