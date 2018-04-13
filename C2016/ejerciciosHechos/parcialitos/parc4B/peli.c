#include "peli.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

t_pelicula* t_p_crear(const char* titulo,const char* director,const char* protag,long int presup,short int puntaje,int year){

	t_pelicula *aux;
	aux = (t_pelicula*) malloc (sizeof(t_pelicula));
	

	strcpy(aux->titu,titulo);
	strcpy(aux->dire,director);
	strcpy(aux->prot,protag);
	aux->pres = presup;
	aux->punt = puntaje;
	aux->anio = year;
	
	return aux;
}

int t_p_cmp_puntaje(t_pelicula a, t_pelicula b){
	
	int aux;	
	if (a.punt > b.punt)
		aux = 1;
	else if (b.punt > a.punt)
		aux = -1;
	else
		aux = 0;
		
	return aux;
}

void t_p_sumar_puntaje(int suma, t_pelicula p){
	
	int aux;
	aux = p.punt;
 
	aux = aux + suma;

	if (aux > 5)
		aux = 5;

	p.punt = aux;	

	printf("%d \n",p.punt);
}

void t_p_a_cadena(t_pelicula p, char* s){
	
	//strcat(s,p->titu);
	//strcat(s,p->dire);
	sprintf(s,"%s, %s",p.dire,p.titu);

}

/*void t_p_destruir(t_pelicula p){
	free(*p);
	
}
*/