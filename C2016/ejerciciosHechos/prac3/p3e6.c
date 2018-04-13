//Practica 3 Ejercicio 6 || Estado: COMPLETO
//Realizar una funcion que dado un string. Lo
//imprima en orden inverso. Haga dos
//implementaciones de la funcion: iterativa y
//recursiva.
//
#include <stdio.h>
#include <string.h>

void inverITE(char* p)
{
	/* si el string vale null */
	if (p == 0){
		return;
	}

	/* si el string esta vacio */
	if (*p == 0){
		return;
	}

	/* conseguir el largo del string */
	char *start = p;
	char *end = start + strlen(p) - 1;
	char temp;

	/*reversa*/
	while (end > start){
		temp = *start;
		*start = *end;
		*end = temp;

		++start;
		--end;
	}
}

int main(int argc, char const *argv[])
{
	char p[64];
	fgets(p,  64, stdin);
	int i;

	inverITE(p);

	for (i = 0; i < (strlen(p));i++){
		printf("%c\n",p[i] );
	}

	return 0;
}
