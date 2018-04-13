//Practica 3 Ejercicio 8 y el 9 mas o menos || Estado: COMPLETO ponele
//Analice lo que hacen las funciones de la
//libreria string.h:
//-------------
//char *strcat(char *dest, const char *src);
//int strcmp(const char *s1, const char *s2);
//char *strcpy(char *dest, const char *src);
//size_t strlen(const char *s);
//char *strstr(const char *haystack, const char *needle);
//-------------
//
#include <stdio.h>
#include <string.h>

int main(int argc, char const *argv[])
{
	char str1[64];
	printf("Ingrese string de prueba 1: \n");
	fgets(str1,64,stdin);

	char str2[64];
	printf("Ingrese string de prueba 2: \n");
	fgets(str2,64,stdin);

	/*
	printf("strcat concatena un string o string literal a un string destino: \n");
	strcat(str1,str2);
	printf("%s\n",str1);
	*/

	/*
	printf("strcmp compara dos strings;\n");
	int comp = strcmp(str1,str2);
	if (comp < 0){
		printf("%dEl primer string es mas grande\n");
	}
	else if (comp > 0){
		printf("%dEl segundo string es mas grande\n");
	}
	else {
		printf("Ambos strings son iguales\n");
	}
	*/

	/*
	printf("\nstrcpy copia un string a otro\n");
	char  copia[64];
	strcpy(copia,str1);
	printf("la copia del primero es %s\n",copia);
	strcpy(copia,str2);
	printf("la copia del segundo es %s\n",copia);
	*/

	/*
	printf("\nstrlen me devuelve el largo del string, como podemos ver,\n por algun motivo no anda con fgets");
	printf("el largo del primero es %d\n",strlen(str1));
	printf("el largo del segundo es %d\n",strlen(str2));
	*/

	/*
	printf("strstr me devuelve un puntero de donde se encuentre la primer ocurrencia de needle en haystack\n");
	char *ret ;

	ret =strstr(str1,str2); //str1 tiene que contener a str2

	printf("%s",strcat(ret," de Peron")); 
	*/

	return 0;
}
