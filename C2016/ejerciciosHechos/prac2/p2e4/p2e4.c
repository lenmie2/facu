/*Escriba un programa que lea caracteres del teclado empleando
getchar() y los cuente hasta encontrar EOF. Luego debe imprimir la
cantidad de caracteres y lineas encontradas.

Nota: puede leer de teclado o invocar el programa con un archivo
como parametro. Por ejemplo:
------------------
./ejecutable.bin < archivo_param
------------------
Esto hace que el contenido de archivo_param se vea desde el programa
ejecutable.bin como proveniente del teclado.
Notara que si solo utiliza el teclado el programa no funcionara hasa que
ingrese ENTER. Esto es propio del manejo de buffers en C.
*/

#include <stdio.h>

int main()
{
	int c;
	int cars,lins;
	cars =0;
	lins =0;
	printf("Ingrese texto, el programa contara la cantidad de caracteres y de lineas luego de ingresar control-z\n");
	while((c=getchar())!=EOF)
	{
		if (c==10) //tambien funciona '/n'
            lins++;
		else
            cars++;
	}

	printf("la cantidad de caracteres son: %d, y la de lineas: %d",cars,lins);
	return 0;
}
