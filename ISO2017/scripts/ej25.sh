#!/bin/bash
#REVISAR
#Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema
#pertenecientes al grupo “users”. Adicionalmente el script puede recibir como parametro:
#“-b n”: Retorna el elemento de la posición n del arreglo si el mismo existe. Caso
#contrario, un mensaje de error.
#“-l”: Devuelve la longitud del arreglo
#“-i”: Imprime todos los elementos del arreglo en pantalla
usuarios=$(cut -d: -f1,4 /etc/passwd | grep $(getent group users | cut -d: -f3) | cut -d: -f1)	
arr=()
for each in ${usuarios[*]}
do
	arr=( ${arr[*]} $each )
done

case $1 in
	"-b")
	if [ $# -eq 2 ]
	then
	  	if [ $2 -lt ${#arr[*]} ] 
    		then
    			echo "el elemento en la posicion $2 es ${arr[$2]}"
	    	else
    			echo "no se encuentra el dato"
    		fi
	else
		echo "error, cantidad de parametros incorrecta"		
		exit 1
	fi
	;;
	"-l")
		echo "La cantidad de usuarios es ${#arr[*]}"
	;;
	"-i")
		echo "Usuarios: ${arr[*]}"
  	;;

esac
