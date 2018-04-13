//p3e2
//¿Que imprime el siguiente fragmento de codigo?
//--
//char *arr1 = "Hola mundo";
//char arr2[20];
//
//printf("%d", sizeof(arr1));
//printf("%d", sizeof(arr2));
//--
//Analizando antes de correr el programa,
//sizeof me retorna el tamaño del archivo
//en el caso de arr1 seria 4, el largo del puntero
//en el caso de arr2 seria 20, el largo de todo el arreglo
//
#include <stdio.h>

int main(int argc, char const *argv[])
{
	char *arr1 = "Hola mundo";
	char arr2[20];

	printf("%d", sizeof(arr1));
	printf("%d", sizeof(arr2));

	return 0;
}
