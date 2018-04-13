//Practica 3 Ejercicio 4
//Realizar un programa que dado un arreglo de enteros
// lo muestre ordenado de menor a mayor
//--no es necesario leer el arreglo desde el teclado
//--use arreglos de prueba
//Lei del teclado de todas formas, al final el problema
//me llevo mucho mas de lo que crei.
#include <stdio.h>

int main(int argc, char const *argv[])
{

	int cant,t,j,i,p,aux;

	printf("Ingrese la cantidad de numeros del arreglo: ");
	scanf("%d",&cant);

    int aNum[cant];

	printf("\nIngrese %d numeros: \n",cant);
	for (i = 0; i < cant;i++){
        scanf("%d",&aNum[i]);
	}

	for (i = 0;i < (cant-1);i++){
		p=i;

		for (j = i+1;j < cant;j++){
			if (aNum[j] <= aNum[p])
				p = j;
		}

		if (p != i){
        aux = aNum[p];
        aNum[p] = aNum[i];
        aNum[i] = aux;
		}
	}
	printf("\nLos numeros de menor a mayor son: ");
	for (i = 0; i < cant; i++){
		printf("%d ",aNum[i]);
	}

	return 0;
}
