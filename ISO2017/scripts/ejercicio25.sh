#! /bin/bash
usuarios= $(cut -d: -f1,4 /etc/passwd | grep $(getent group users | cut -d: -f3) | cut -d: -f1)

case $1 in
	"-b")
  	if [ $2 -lt ${#usuarios[*]} ]
    	then
    		echo ${usuarios[$2]}
    	else
    		echo "no se encuentra el dato"
    	fi
	;;
	"-l")
		echo "La cantidad de usuarios es "${#usuarios[*]}
	  ;;
	"-i")
		echo "Usuarios: "${usuarios[*]}
  		;;

esac
