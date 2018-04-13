#include "datos.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

///PREGUNTAR COMO PUEDO RESOLVER COPIARALUMNO 
///MANDANDO UNA VARIABLE POR REFERENCIA
///
///PORQUE NO ANDA BIEN LA CREACION¡?
///
int main(int argc, char const *argv[])
{

	t_alumno* a1;
	t_alumno* a2;

	a1 = crearAlumno();

	a2 = copiarAlumno(*a1);

	imprimirAlumno(*a1);
	imprimirAlumno(*a2);

	modificarAlumno(a2);
	imprimirAlumno(*a2);

	destruirAlumno(a1);
	destruirAlumno(a2);

	return 0;
}