typedef struct{
	char titu[64];
	char dire[64];
	char prot[64];
	long int pres;
	short int punt;
	int anio;

}t_pelicula;

t_pelicula* t_p_crear(const char* titulo,const char* director,const char* protag,long int presup,short int puntaje,int year);

int t_p_cmp_puntaje(t_pelicula a, t_pelicula b);

void t_p_sumar_puntaje(int suma, t_pelicula p);
	
void t_p_a_cadena(t_pelicula p, char* s);

//void t_p_destruir(t_pelicula p);
	

