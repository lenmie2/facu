#!/bin/bash
#Escribir un script que al ejecutarse imprima en pantalla los nombre de los archivos que se
#encuentran en el directorio actual, intercambiando minúsculas por mayúsculas, además de
#eliminar la letra a (mayúscula o minúscula)

ls | tr a-zA-Z A-Za-z | tr -d aA
