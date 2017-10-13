#! /bin/sh
if [ $# -ge  2 ]
then
	echo la suma es $( expr $1 + $2 )
	echo la multiplicacion es $( expr $1 \* $2 )
	echo la resta es $( expr $1 - $2 )
	if [ $1 -gt  $2 ]
		then
			echo $1 es mas grande
		else
			echo $2 es mas grande
	fi
fi

