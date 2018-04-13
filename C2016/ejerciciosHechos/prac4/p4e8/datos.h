typedef struct{
	char* nom;
	char* ape;
	int	leg;
	char* doc;
	long int num;

} t_alumno;

t_alumno* crearAlumno();

t_alumno* copiarAlumno(t_alumno a1);

void modificarAlumno(t_alumno* a);

char* alumToString(t_alumno);

void imprimirAlumno(t_alumno a);

void destruirAlumno(t_alumno* a);

