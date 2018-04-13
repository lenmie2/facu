//#ifndef PUNTOS_H
//#define PUNTOS_H

typedef struct{
	int x;
	int y;
}t_punto;

t_punto crearPunto(int a,int b);
char* puntoToString(t_punto punto);
t_punto sumarPuntos(t_punto p1,t_punto p2);
void trasladarX(t_punto* p, int mod);
void trasladarY(t_punto* p, int mod);
t_punto distanciaOrigen(t_punto p);

//#endif