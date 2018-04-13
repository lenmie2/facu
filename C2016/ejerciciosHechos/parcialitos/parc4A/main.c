#include <stdio.h>
#include "puntos.h"

int main(int argc, char const *argv[])
{
	t_punto p1;
	t_punto p2;
	t_punto p3;
	char* aux;

	p1 = crearPunto(4,3);
	printf("%d %d\n",p1.x,p1.y);
	p2 = crearPunto(3,4);
	printf("%d %d\n",p2.x,p2.y);

	aux = puntoToString(p1);
	printf("%s\n",aux);

	p3 =sumarPuntos(p1,p2);
	printf("%d %d\n",p3.x,p3.y);

	trasladarX(&p1,5);
	printf("%d %d\n",p1.x,p1.y);
	trasladarY(&p1,8);
	printf("%d %d\n",p1.x,p1.y);

	p3 = distanciaOrigen(p2);
	printf("%d %d\n",p3.x,p3.y);


	return 0;
}