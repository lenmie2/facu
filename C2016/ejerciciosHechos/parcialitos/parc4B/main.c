/*Cree una "librería" (separando en los archivos .c y .h que sean necesarios) para gestionar datos de películas.

Para esto debe crear el tipo T_pelicula teniendo en cuenta que de cada pelicula se conoce:

Título
Director/a
Protagonista
Presupuesto
Puntaje (0-5)
Año
Para debe declarar las siguientes operaciones para este tipo:

t_p_crear: Crea una película inicializando cada uno de sus datos con los que se pasen como parámetro.
t_p_cmp_puntaje: Recibe 2 películas como parámetro y las compara por puntaje (retornando -1, 0 o 1 como strcmp).
t_p_sumar_puntaje: Recibe un entero con signo y lo suma al puntaje actual.
t_p_a_cadena: Recibe un puntero a char y lo carga con el nombre de la película seguido del nombre del director/a (para utilizarlos por ejemplo con printf).
t_p_destruir: Libera la memoria alocada dinámicamente para la película (si es que se usó memoria dinámica).
Desarrolle una función main() que inicialice y utilice al menos 3 películas distintas, imprimiendo en pantalla el resultado de las diferentes operaciones.

Nota: en la función main() se deben utilizar todas las funciones antes listadas.

Aclaración: t_p_a_cadena se usaría de la siguiente manera:

...
T_pelicula peli;
char cadena[1024];
...
t_p_a_cadena(peli, cadena);
printf(cadena);
Lo que imprimiría en pantalla por ejemplo: X-Men: Apocalipsis, Bryan Singer
*/

#include "peli.h"
#include <stdio.h>

int main()
{
	int aux;
	char aux2[1024];

	t_pelicula *p1;
	t_pelicula *p2;
	t_pelicula *p3;
	
	p1 = t_p_crear("2001 Odisea en el espacio","Stanley Kubrick","Keir Dullea",12000000,4,1968);
	p2 = t_p_crear("Apocalipyse Now","Francis Ford Coppola","Marlon Brando",31500000,3,1979);
	p3 = t_p_crear("Aliens","James Cameron","Sig Weaver",17000000,3,1986);

	aux = t_p_cmp_puntaje(*p1,*p2);
	printf("%d \n",aux);

	t_p_sumar_puntaje(4,*p3);

	t_p_a_cadena(*p2,aux2);
	printf("%s",aux2);
/*
	t_p_destruir(*p1);
	t_p_destruir(*p2);
	t_p_destruir(*p3);
*/
	return 0;
}
