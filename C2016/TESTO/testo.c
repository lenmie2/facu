#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char const *argv[])
{
	
	FILE *archivo;
	int i;
	char* strAux;

	strAux = (char*) malloc(1024);

	archivo = fopen("testo.txt","w");

	if (archivo != NULL){
		for (i = 1; i < argc; i++){
			strcat(strAux,argv[i]);
			//strcat(strAux,"\n");
			printf("valor del argumento en la posicion %d: %s escrito\n",i,argv[i]);
		}
	}
	else{
		printf("No se a podido abrir el programa\n");
	}

	fwrite(strAux,1,strlen(strAux),archivo);
	fwrite("\n",1,strlen("\n"),archivo);
	fwrite("5555",1,strlen("5555"),archivo);

	free(strAux);

	return 0;
}