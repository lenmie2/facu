#!/bin/bash
#Escribir un Programa de “Menu de Comandos Amigable con el Usuario” llamado menu,
#el cual, al ser invocado, mostrará un menú con la selección para cada uno de los scripts creados
#en esta práctica. Las instrucciones de como proceder deben mostrarse junto con el menú.
#El menú deberá iniciarse y permanecer activo hasta que se seleccione Salir.

echo "MENU DE OPCIONES"
select opcion in $(ls) salir
do
	case $opcion in
		"salir" )
			exit 0
			break
		;;
		*)
			echo "----iniciando opcion $opcion----"
			bash $opcion
			break			
	esac
done
	
