#include <stdio.h>

int main()
{
	int c,ch,li;
	ch=0;
	li=0;
	printf("Ingrese string, termine con EOF\n");
	while ((c=getchar()) != EOF){
		if(c == '\n')li++;
		else ch++;
	}
	printf("la cantidad de caracters es: %d, y la de lineas %d",ch,li);

	return 0;
}
