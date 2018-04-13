#include <stdio.h>
#include <sys/stat>
#include <sys/types>

int main(int argc, char const *argv[])
{

	struct stat estatus;
	stat(argv[1],&estatus);
	
    printf("Informacion para %s\n",argv[1]);
    printf("---------------------------\n");
    printf("Tamaño del archivo: \t\t%d bytes\n",estatus.st_size);
    printf("Ultimo acceso: %d\n",estatus.st.mtim);

	return 0;
}