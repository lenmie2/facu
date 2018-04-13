//p3e3
//Describa las diferencias entre un arreglo multidimencional
//y un arreglo de punteros. Por ejemplo:
//--
//char arr1[][15] = {"uno","dos","tres"};
//char arr2[5][15];
//char *arr3[] = {"uno","dos","tres"};
//char *arr4[4];
//--
//a)Para cada caso mencionado muestre como se representan
//fisicamente en memoria. Puede emplear un grafico
//Indique el tamaño de las variables arr1,arr2,arr3,arr4
//
//un arreglo multidimencional se almacena en memoria
//estatica en el momento de declar su variables
//un arreglo de punteros solo almacenan la primera columna
//para cada fila se pide memoria en la heap con malloc
//
//arr1	tam= 45 (3*15)
//   (0)(1)(2)(3)(4)(5)(6)(7)(8)(9)(10)(11)(12)(13)(14)
//(0)[u][n][o][-][-][-][-][-][-][-][-][-][-][-][-][-][-]
//(1)[d][o][s][-][-][-][-][-][-][-][-][-][-][-][-][-][-]
//(2)[t][r][e][s][-][-][-][-][-][-][-][-][-][-][-][-][-]
//
//arr2	tam=75 (5*15)
//  (0)(1)(2)(3)(4)(5)(6)(7)(8)(9)(10)(11)(12)(13)(14)
//(0)[-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-]
//(1)[-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-]
//(2)[-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-]
//(3)[-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-]
//(4)[-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-][-]
//
//arr3 tam=12 (3*4) (cantidad de filas * tamaño de puntero)
//     (0)(1)(2)(3)
//(0)->[u][n][o][-]
//(1)->[d][o][s][-]
//(2)->[t][r][e][s]
//
//arr4 tam=16 (4*4) (cantidad de filas * tamaño de puntero)
//     (0)(1)(2)(3)
//(0)->[-][-][-][-]
//(1)->[-][-][-][-]
//(2)->[-][-][-][-]
//(3)->[-][-][-][-]
//
#include <stdio.h>
#define COL 4
#define FIL 4

int main(int argc, char const *argv[])
{
    char arr1[][15] ={"uno","dos","tres"};
    char arr2[5][15];
    char *arr3[] ={"uno","dos","tres"};
    char *arr4[4];
    int co,fi;
	for (fi = 0;fi < FIL;fi++){
		for (co=0; co < COL;co++){
        printf("c= %d f= %d cont=%c\n",co,fi,arr3[fi][co]);} //reemplazar con el arreglo que se quiere imprimir
		printf("\n");
	}
	printf("\n Tamaños de arreglos \n");
    printf("arr1: %d,arr2: %d,arr3: %d,arr4: %d,", sizeof(arr1), sizeof(arr2), sizeof(arr3), sizeof(arr4));
	return 0;}
