#! /bin/bash
select opcion in listar donde quien exit
do
	case $opcion in
		"listar")
			ls	
		;;
		"donde")
			pwd
		;;
		"quien")
			who
		;;
		"exit")
			exit
		;;
		*)
		echo "opcion incorrecta";;
	esac
done
