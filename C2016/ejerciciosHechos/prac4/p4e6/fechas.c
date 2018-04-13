#include "fechas.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

t_fecha* ini(t_fecha* f){
	f = (t_fecha*) malloc(sizeof(t_fecha));

	f->dia = 1;
	printf("algo");
	f->mes = (char*) malloc(strlen("enero"));
	strcpy(f->mes,"enero");

	f->anio = 1970;

	return t_fecha*;
	
}