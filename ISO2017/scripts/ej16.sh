#!/bin/bash
#Realizar un script que reciba como parámetro una extensión y haga un reporte con 2
#columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. 
#Sedebe guardar el resultado en un archivo llamado reporte.txt
if [ $# -ne 1 ]
then
	echo "no se ingresaron la cantidad de parametros necesarios"
else
		for USUARIOS in $(cat /etc/passwd | cut -d":" -f1)
		do
		  var=$( sudo find /home -user ${USUARIOS} -name "*${1}" |wc -l )
			echo "$USUARIOS -|- $var " >> report.txt
			echo "creado"
		done
fi
