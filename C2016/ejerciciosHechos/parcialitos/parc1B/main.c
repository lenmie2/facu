#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>


char cambiar_caracter(char car)
{
	if ((car>=97) && (car<=122)) {car=car-32;}
	else if ((car>=65) && (car<=90)){car=car+32;}

	return car;
}

int main(){
    int n;

    printf("cambiar_caracter('%c') retorna %c\n", 'a', cambiar_caracter('a'));
    printf("cambiar_caracter('%c') retorna %c\n", 'B', cambiar_caracter('B'));
    printf("cambiar_caracter('%c') retorna %c\n", 'z', cambiar_caracter('z'));
    printf("cambiar_caracter('%c') retorna %c\n", '4', cambiar_caracter('4'));
    printf("cambiar_caracter('%c') retorna %c\n", '/', cambiar_caracter('/'));
    scanf("&d",n);

    return EXIT_SUCCESS;
}
