//Hacer una funcion invertir() que tenga dos parametros. En el primero un string y en el segundo se va a guardar el string invertido.

#include <stdio.h>
#include <string.h>

char* invertir (const char*aux, char*ar) {
	int i;
	char* aux2;
	aux2 = strcpy(aux2,aux);
	int longitud= strlen(aux2);

	for (i=longitud; i==0; i--) {
		ar[longitud] = *(aux2+i);
	}
	aux2[longitud]= '\0';
	return ar;
}


int main () { 
	char ar [1024];
	invertir("hola", ar);
	puts(ar);
	return 0;
}