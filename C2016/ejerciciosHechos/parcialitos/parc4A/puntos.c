#include "puntos.h"
#include <stdio.h>
#include <stdlib.h>

/*
Inicializa un nuevo punto con las coordenadas
recibidas como parametro y lo retorna
*/
t_punto crearPunto(int a,int b){
	t_punto aux;
	aux.x = a;
	aux.y = b;

	return aux; 
}

/*
convierte el parametro de tipo t_punto a una 
representacion de string con el siguiente formato
"(x,y)"
*/
char* puntoToString(t_punto punto){
	char* aux;
	aux = (char*) malloc(15);
	sprintf(aux,"(%d,%d)",punto.x,punto.y);

	return aux;
	}

/*
realiza la suma de dos puntos y retorna un nuevo
punto con el resultado. La suma de dos puntos. 
A y B, se realiza adicionando las coordenadas
X entre si y las Y por su lado
*/
t_punto sumarPuntos(t_punto p1,t_punto p2){
	t_punto aux;
	aux.x = p1.x + p2.x;
	aux.y = p1.y + p2.y;

	return aux;
}

/*
traslada el punto en el eje X. Esto es sumando un
valor entero a la coordenada X, modificando dicho
atributo recibido como parametro
*/
void trasladarX(t_punto* p, int mod){
	p->x = p->x+mod;

}

/*
traslada el punto en el eje Y. Esto es sumando un
valor entero a la coordenada Y modificando dicho
atributo recibido como parametro
*/
void trasladarY(t_punto* p, int mod){
	p->y = p->y+mod;

}
/*
retorna un nuevo punto cuyas coordenadas son la 
distancia (valor siempre positivo) del punto al origen
[el punto (0,0)]. Por ejemplo la distancia al origien
del punto (-8,60) devolvera el punto (8,60)
*/
t_punto distanciaOrigen(t_punto p){
	t_punto aux;
	aux = p;
	if (aux.x < 0)
		aux.x = (aux.x)*(-1);
	
	if (aux.y < 0)
		aux.y = (aux.y)*(-1);
	

	return aux;
}


