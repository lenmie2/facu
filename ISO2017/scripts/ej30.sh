#!/bin/bash
#Realice un script que mueva todos los programas del directorio actual (archivos ejecutables)
#hacia el subdirectorio “bin” del directorio HOME del usuario actualmente logueado. El script
#debe imprimir en pantalla los nombres de los que mueve, e indicar cuántos ha movido, o
# que no ha movido ninguno. Si el directorio “bin” no existe,deberá ser creado

subcarpeta="/home/$(whoami)/bin/"
count=0
if ![ -d $subcarpeta ]
then
	mkdir $subcarpeta
else
	for each in$( find . -type f -name "*.jpg" )
	do
		mv $each "$subcarpeta $each"
		echo "$subcarpeta $each"
		let count++		
	done 
done
if [ count -gt 0 ]
then
	echo "se han movido $count archivos"
else
	echo "no se han movido archivos"
fi
exit

