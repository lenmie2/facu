#! /bin/sh
echo ingrese dos numeros
read num1 num2
echo la suma es $( expr $num1 + $num2 )
echo la multiplicacion $( expr $num1 * $num2 )
echo la resta es $( expr $num1 - $num2 )
if [ $num1 -gt  $num2 ]
then
	echo $num1 es mas grande
else
	echo $num2 es mas grande
fi
