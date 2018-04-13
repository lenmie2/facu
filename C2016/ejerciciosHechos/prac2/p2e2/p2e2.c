/*Escriba un programa que verifique que la expresion
getchar() != EOF sea 1 o 0. */

#include <stdio.h>
int main()
{
	int c;
	printf("%d",((c=getchar())!= EOF));

	return 0;
}
