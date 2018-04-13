/*Escriba un programa que copie caracteres del teclado en la pantalla
reemplazando cada ocurrencia de barra inverida por \\. cada tabulacion
por \t cada enter por \n.
Emplee getchar().
------------------------------
/--por ejemplo. si ingresa:
hola	mundo
chau mundo\
/--debe imprimir
hola\tmundo\nchau mundo\\
------------------------------
*/


#include <stdio.h>

int main()
{
	char c,cp;
	c=getchar();
	while(c=!EOF){
		switch(c){
			case 92 : cp = (92 92);  //NIDEAMAN
			case 09 : cp = (92 116);
			case 10 : cp = (92 110);
			default: cp=c;
		}
		putchar(cp);
		c=getchar();
	}

	return 0;
}
