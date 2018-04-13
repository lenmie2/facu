//Practica 4 Ejercicio 5
//Realizar una funcion que reciba dos arreglos de
//enteros y almacene en un tercer arreglo la suma
//de sus elementos.
//
#include <stdio.h>

int* sumArre(int a1[], int a2[], int dim)
{
	static int a3[5];
	int i;

	for (i = 0; i < dim; i++){
		a3[i] = a1[i]+ a2[i];
	}

	return a3;
}

int main(int argc, char const *argv[])
{
	int i;
	int a1[]= {2,4,6,8,10};
	int a2[]= {1,1,1,1,1};
	int *a3;

	a3 = sumArre(a1,a2,5);

	for (i = 0; i < 5;i++){
		printf("pos= %d elem= %d\n",i,a3[i] );
	}

	return 0;
}
