#include "suma.h"
int sumatoria(int desde, int hasta)
{
	int sum= 0;
	for (;desde<=hasta; desde++) {
		sum= sumar(sum, desde);
	}
	return sum;
}