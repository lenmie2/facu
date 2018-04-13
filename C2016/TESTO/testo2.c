#include <stdio.h>

unsigned char buffer[64];

int main(int argc, char const *argv[])
{
	
	FILE *arch;
	int contador,sz;

	arch = fopen("letra.txt","rb"); 
	fseek(arch,0L,SEEK_END);
	sz = ftell(arch);
	printf("tamaño del archivo %d\n",sizeof(sz));
	rewind(arch);
	contador = 0;
	while ((fread(buffer,sizeof buffer,1,arch) ==1)
	{
		contador++;
		printf("%x\n",buffer[contador]);
	}


/*

	if (arch)
	{
			for (contador = sz; contador >= 0; contador--){
//			mi_registro.x = contador;
			fread(&mi_registro, sizeof(mi_registro),1, arch);
			printf("%x %x %x\n",mi_registro.x,mi_registro.y,mi_registro.z);
			}
	}	
	else{
			printf("No se pudo abrir el archivo!\n");
			return 1;
	}
*/
	fclose(arch); 
	return 0;
}