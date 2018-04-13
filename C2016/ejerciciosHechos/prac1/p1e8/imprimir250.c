#include <stdio.h>
#include "sumaPar.h"
int main()
{
	int nu,sum;
	printf("Ingrese un numero: ");
	scanf("&d",nu);
	sumaPar(nu,sum);
	printf("%d",sum);

	return 0;
}
