#! /bin/bash
num=(10 3 5 7 9 3 5 4)
imp=0
for (( i=0; i<${#num[@]}; i++ ))
do
        aux=`expr ${num[$i]} % 2`
        if [ $aux == 0 ]
        then
		echo "${num[$i]}"
        else
		imp=$(expr $imp + 1)
        fi
done
echo "la cantidad de los impares es" $imp



