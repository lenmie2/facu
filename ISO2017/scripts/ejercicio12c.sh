#! /bin/sh
case $2 in
	"+")
echo la suma es $( expr $1 + $3 )
		
	;;	
	"-")
echo la resta $( expr $1 - $3 )

	;;
	"*")
echo la multiplicacion $( expr $1 \* $3 )

	;;
	"/")

echo la division $( expr $1 / $3 )
	;;
	*)
echo error, operador incorrecto
	;;
esac
