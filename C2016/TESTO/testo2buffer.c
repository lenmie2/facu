#include <stdio.h>

int main(int argc, char const *argv[])
{
	
	FILE *arch;
	int contador;
	unsigned char buffer[10];

	arch = fopen("letra.txt","rb");
	if (arch)
	{
		for (contador = sizeof(*arch); contador >= 0; contador--){
//			mi_registro.x = contador;
			fread(buffer, sizeof(buffer),1, arch);
			printf("%x ",buffer[contador]);
		}
	}
	else{
			printf("No se pudo abrir el archivo!\n");
			return 1;
	}

	fclose(arch); 
	return 0;
}