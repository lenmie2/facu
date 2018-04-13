#include <stdio.h>
#include "matem.h"
int main()
{
	int desde = 1;
	int hasta = 10;
	int resultado = sumatoria(desde,hasta);

	printf("la sumatoria de %d a %d es: [ %d ]\n", desde, hasta, resultado);

	return 0;
}