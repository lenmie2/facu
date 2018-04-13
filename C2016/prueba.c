#include <stdio.h>
#include <string.h>

int main()
{
    int largo;
	char nombre1[]="lalalala4lalalala8";
	char nombre2[]="lalalala4";
	//largo = strlen(nombre1);
	strcpy(nombre2,nombre1);
	//printf("%d", largo);
	printf("el nombre ingresado es: %s y %s ",nombre1,nombre2);


	return 0;
}
