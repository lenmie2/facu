/*Escriba un programa que imprima el valor de EOF.
¿Alcanza el tipo char para almacenar EOF?
¿Seria correcto el sifuiente extracto de codigo?
-------------------------
char c;

c = getchar();
while (c != EOF) {
-------------------------

*/

#include <stdio.h>

int main()
{
    int c;
	printf("ingresa controlz");   //imprime -1, ni idea porque
	c= getchar();
	putchar(c);
    printf("\n%d",c);
	return 0;
}
