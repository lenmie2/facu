#include <stdio.h>
#include "inic.h"

int main()
{
	int a;
	int i = ini(&a);
	printf("%d\n",a);
	return 0;
}