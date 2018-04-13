#include <stdio.h>

int main(int argc, char const *argv[])
{
	char prod[50];
	char marca[50];
	int c,ente,dec;
	float prec;
	printf("<table>");
	printf("Lista de productos \n");
	c = scanf("%s%s%f",prod,marca,&prec);
	while (c == 3){
		ente = prec;
		dec = (prec = (perc - ente)*100);
		printf("<tr><td>%s</td><td>%s</td><td>%d pesos y %d centavos</td></tr> \n",prod,marca,ente,dec);
		c= scanf("%s%s%f",prod,marca,&prec);
	}
	if (c != 3){
		printf("Error de lectura, %d conversiones por scanf",c);
	}
	printf("</table>");

	return 0;
}
