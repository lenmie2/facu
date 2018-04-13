#include <stdio.h>
#define cuadrado(x) ((x)*(x))

int main()
{
	int num;
	printf("ingrese un numero: ");
    scanf("%d",&num);
	printf("cuadrado es: %d\n",(cuadrado(num)));

	return 0;
}
