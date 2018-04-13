//Practica 3 Ejercicio 7 || Estado: COMPLETO
//Realizar una funcion que dado un string,
//devuelva la cantidad de palabras que contiene.
//
#include <stdio.h>
#include <string.h>

int cantPalab(char *str)
{

	char * start = str;
	char * end = start + strlen(str) - 1;
	char buffer;

	int i = 0, cant = 0;

	while (start < end){
		if (*start != ' '){
			++cant;
			while ((*start != ' ') && (start < end)){
				++start;
			}
		}
		if (*start == ' '){
			while ((*start == ' ') && (start < end)){
				++start;
			}
		}
	}

	return cant;
}

int main(int argc, char const *argv[])
{
	//char p[]="opera zion y el judio errante";
	char p[64];

	printf("Ingrese una secuencia de palabras: \n");
	fgets(p,64,stdin);
	int n = cantPalab(p);
	printf("Su cantidad de palabras es: %d",(n));
	return 0;
}
