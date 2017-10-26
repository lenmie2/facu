#!/bin/bash
#Implemente un script que agregue a un arreglo todos los archivos del directorio /home cuya
#terminación sea .doc. Adicionalmente, implemente las siguientes funciones que le permitan
#acceder a la estructura creada:
#verArchivo <nombre_de_archivo>: Imprime el archivo en pantalla si el mismo se
#	encuentra en el arreglo. Caso contrario imprime el mensaje de error “Archivo no en-
#	contrado” y devuelve como valor de retorno 5
#cantidadArchivos: Imprime la cantidad de archivos del /home con terminación .doc
#borrarArchivo <nombre_de_archivo>: Consulta al usuario si quiere eliminar el archi-
#		vo lógicamente. Si el usuario responde Si, elimina el elemento solo del arreglo. Si el
#		usuario responde No, elimina el archivo del arreglo y también del FileSystem. Debe
#		validar que el archivo exista en el arreglo. En caso de no existir, imprime el mensaje
#		de error “Archivo no encontrado” y devuelve como valor de retorno 10

for each in $(find /home/negro/Downloads -type f -name "*.jpg")
do
	documentos=( ${documentos[*]} $each )
done
verArchivo(){
	echo "ingrese el nombre del documento a encontrar "
	read doc
	for each in ${documentos[*]}
	do
		if  [ $(echo "$each" | grep "$doc") ]
		then
			echo $each
			return 0
		fi
	done
		echo "error. Archivo $doc no encontrado."
		return 5
}

borrarArchivos(){
	echo "ingrese el nombre del documento a borrar "
	read doc
	pos=0
	for each in ${documentos[*]} 
	do
		if  [ $(echo "$each" | grep "$doc") ]
		then
			echo "archivo $each encontrado, desea borrarlo solo logicamente? SI/NO"
			read opcion
			unset documentos[$pos]
			if [ $opcion = "NO" ]
			then
				rm ${documentos[$pos]}
			fi
			return 0
		fi
		let pos++
	done
	echo "error. Archivo $1 no encontrado."
	return 10
}

select opcion in verArchivo cantidadArchivos borrarArchivos salir
do
	case $opcion in
		"verArchivo")
			verArchivo
		;;
		"cantidadArchivos")
			echo ${#documentos[*]}
		;;
		"borrarArchivos")
			borrarArchivos
		;;
		"salir")
			exit 0
		;;
	esac
done
		

