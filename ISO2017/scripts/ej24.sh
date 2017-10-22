#!/bin/bash
#Dada la definición de 2 vectores del mismo tamaño y cuyas longitudes no se conocen.
#Complete este script de manera tal de implementar la suma elemento a elemento entre
#ambos vectores y que la misma sea impresa en pantalla de la siguiente manera:
#La suma de los elementos de la posición 0 de los vectores es 6
#La suma de los elementos de la posición 1 de los vectores es 178
#...
#La suma de los elementos de la posición 4 de los vectores es 10

arr1=(1 2 3 4 5)
arr2=(1 2 3 4 5)

for ((i=0; i<${#arr1[*]}; i++))
do
  result=$(expr ${arr1[$i]} + ${arr2[$i]})
  echo "La suma de los elementos de la posicion $i de los vectores es $result"
done

