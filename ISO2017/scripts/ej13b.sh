#!/bin/bash
#Crear un script que según la opción elegida se le debe mostrar:
#Listar: lista el contenido del directoria actual.
#DondeEstoy: muestra el directorio donde me encuentro ubicado.
#QuienEsta: muestra los usuarios conectados al sistema
echo "desea listar, ver quien esta conectado, o ver quien esta"
read opcion
case $opcion in
	"listar" )
		ls
	;;
	"donde" )
		pwd
	;;
	"who" )
		who
	;;
esac
