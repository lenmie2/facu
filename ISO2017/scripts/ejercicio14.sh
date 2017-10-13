#!/bin/bash

if [ $# -ne 3  ]
then
	echo "La cantidad de parametros es incorrecta"
	exit 1
fi
if [ ! -d $1 ]
then
	echo "El primer parametro no es un directorio existente"
	exit 2
fi
if [ -z $3  ]
then
	echo "El tercer parametro es nulo"
	exit 3
fi
case $2 in
	"-a")
		for i in $(ls $1)
			do
				mv $1/$i $1/$i$3
			done
			;;
			"-b")
				for i in $(ls $1)
					do
					mv $/$i $1/$3$i
					done
			;;
			*)
				echo "el segundo parametro db ser -a -b"
				exit 4
esac
			
