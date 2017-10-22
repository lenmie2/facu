#!/bin/bash
#Dentro del mismo script y utilizando las funciones implementadas:
#Agregue 10 elementos a la pila
#Saque 3 de ellos
#Imprima la longitud de la cola
#Luego imprima la totalidad de los elementos que en ella se encuentran.

pila=()
print(){
        echo ${pila[*]} #imprime todos los elementos del arreglo
}

length(){
        echo ${#pila[*]} #imprime el largo del arreglo
}

pop(){
        i="$(echo $(expr ${#pila[*]} - 1))"
        echo ${pila[$i]}
        unset pila[$i]
}

push(){
        pila[${#pila[*]}]=$1 
}
echo -----se agregaran e imprimiran 10 elementos
elementos=("ramon" "camila" "raquel" "carlos" "osvaldo" "cecilia" "silvia" "frida" "esther" "ramona")
for i in ${elementos[*]}
do
	push $i
done
print
#
echo -----se eliminaran 3 y se imprimira la longitud de la cola
pop
pop
pop
echo "longitud es $(length)"
#
echo -----se agregara a anita y se imprimira el resultado final
push anita
print




