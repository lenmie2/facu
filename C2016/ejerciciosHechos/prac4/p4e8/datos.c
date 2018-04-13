#include "datos.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

t_alumno* crearAlumno(t_alumno a)
{
	t_alumno* aux;
	char strAux[64];

	aux = (t_alumno*) malloc(sizeof(t_alumno));

	printf("Ingrese nombre:");
	scanf("%s",strAux);
	printf("\n");
	aux->nom = (char*) malloc(strlen(strAux));
	strcpy(aux->nom,strAux);

	printf("Ingrese apellido:");
	scanf("%s",strAux);
	printf("\n");
	aux->ape = (char*) malloc(strlen(strAux));
	strcpy(aux->ape,strAux);
/*
	printf("Ingrese legajo: ");
	scanf("%d",aux->leg);
	printf("\n");
*/
	aux->leg = 23432;

	printf("Ingrese tipo de documento:");
	scanf("%s",strAux);
	printf("\n");
	aux->doc = (char*) malloc(strlen(strAux));
	strcpy(aux->doc,strAux);
/*
	printf("Ingrese numero de documento\n");
	scanf("%ld",aux->num);
	printf("\n");
*/
	aux->num = 37021340;

	return aux;
}

t_alumno* copiarAlumno(t_alumno a1)
{
	t_alumno* a2;

	a2 = (t_alumno*) malloc(sizeof(t_alumno));

	a2->nom = (char*) malloc(strlen(a1.nom));
	strcpy(a2->nom,a1.nom);

	a2->ape = (char*)  malloc(strlen(a1.ape));
	strcpy(a2->ape,a1.ape);

	a2->leg = a1.leg;

	a2->doc = (char*) malloc(strlen(a1.doc));
	strcpy(a2->doc,a1.doc);

	a2->num = a1.num;

	return a2;

}	
char* alumToString(t_alumno)
{
	char* aux;
	sprintf()

}


void modificarAlumno(t_alumno* a)
{
	char strAux[32];

	printf("Ingrese nuevo nombre:");
	scanf("%s",strAux);

	strcpy(a->nom,strAux);

}

void imprimirAlumno(t_alumno a)
{
	printf("\n Alumno: %s %s \n",a.nom,a.ape);
	printf("legajo: %d\n",a.leg);
	printf("Tipo de documento: %s ,numero: %ld",a.doc,a.num);
}

void destruirAlumno(t_alumno* a)
{
	free(a->nom);
	free(a->ape);
	free(a->doc);
	free(a);
}
	
