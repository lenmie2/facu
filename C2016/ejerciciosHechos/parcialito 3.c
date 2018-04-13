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



#include <stdio.h>
#include <string.h>

char * concatenar(const char *a, const char *b, int flag) {
	static str[64];
	if (flag == 1){
		strcat(a,b);
		strcpy(str,a);
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
	char string1[64];
	char string2[64];
	int i;
	int flag = 0
	
	if (argc > 2){
		i = 2;
		if (argv[i] ="-0"){
			i++;
			string1 = argv[i];
			i++;
			string2 = argv[i];
			}
		else if (argv[i] ="-1"){
			i++;
			string2 = argv[i];
			i++;
			string1 = argv[i];
			}
		flag = 1;
		i++;
		if (argv[i] = "-i") flag = 2;
	}

	if(flag == 0)
		return 23;

	s = concatenar(string1,string2,flag);
	invertir(s,flag);
	printf ("%s\n", s);
	//free(s);
	return 0;
}