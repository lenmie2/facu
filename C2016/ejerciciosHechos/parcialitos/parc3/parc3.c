/*
 * Completar el siguiente codigo de manera tal que el programa funcione
 * de la siguiente manera:
 *
 * si se invoca:
 *   ./main -0 string0 string1
 * imprime:
 *   string0string1
 * si se invoca:
 *   ./main -1 string0 string1
 * imprime:
 *   string1string0
 * si se invoca:
 *   ./main -0 string0 string1 -i
 * imprime:
 *   1gnirts0gnirts  //es decir, los strings concatenados e invertidos.
 *
 * Los argumentos -0 y -1 som obligatorios y mutuamente excluyentes.
 * El argumento -i es opcional. Si no aparece, la función invertir() no
 * debe modificar el string.
 *
 * Ante cualquier error en los argumentos, main debe retornar 23 y no
 * imprimir nada.
 **/

////////////////////////////hice el parcialito3 del martes y no logro resolver el segfault

#include <stdio.h>
#include <string.h>

char * concatenar(char *a,char *b, int flag) {
	static char *str;
	if (flag == 1){
		strcat(a,b);
		strcpy(str,a);
	}
	else if (flag == 2){
		strcat(b,a);
		strcpy(str,b);
	}
	return str;
}
void invertir(char *s, int flag) {
	if (flag == 2){
		char * start = s;
		char * end = start + strlen(s)-1;
		char temp;

		while (start < end){
			temp = *start;
			*start = *end;
			*end = temp;

			++start;
			--end;
		}

	}
}

int main(int argc, char *argv[]) {
	char * s;
	int flag = 0;

	if (argc > 2){									//al parecer tira segfault a partir de esta linea
		if ((strcmp(argv[2],"-0"))==0) flag = 1;
		else if ((strcmp(argv[2],"-1"))==0) flag = 2;
		if ((strcmp(argv[5],"-i"))==0) flag = 3;
	}

	if(flag == 0)
		return 23;

	s = concatenar(argv[3],argv[4],flag);
	invertir(s,flag);
	printf ("%s\n", s);
	//free(s);
	return 0;
}
