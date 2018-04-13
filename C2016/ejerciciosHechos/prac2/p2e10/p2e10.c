#include <stdio.h>
#define DEF "%.*s "
#define DEF2 "%d "
int main()
{
	const char* dias[7] = {
		"Lunes", "Martes", "Miercoles", "Jueves",
		"Viernes", "Sabado", "Domingo"};

	int i;
	for (i = 0; i < 7; i++)
		printf(DEF, 3, dias[i]);

	for (i = 1; i <= 31; i++) {
		if (!((i - 1)% 7))
			printf("\n");
		printf(DEF2, i);   //<<- tengo que usar dos definiciones
	}

	printf("\n");

	return 0;
}
