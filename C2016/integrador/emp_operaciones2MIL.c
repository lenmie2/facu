#include <stdio.h>
#include <string.h>
#include "emp_operaciones.h"
#include "emp_tipos.h"
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

//
// funcion error, la idea es que le pasas por parametro el tipo de error que tubo y lo procesa de acuerdo 
int emp_error(int tipo)		
{
	switch (tipo)
	{
		case 1:
			fprintf(stderr, "Error - argumentos invalidos");
			break;
		case 2:
			fprintf(stderr, "Error - no se encontro el archivo a empaquetar");
			break;
		case 3:
			fprintf(stderr, "Error - no se encontro el archivo a desempaquetar");
			break;
		case 4:
			fprintf(stderr, "Eror - directorio no existe");
		default:
			break;
	}
	exit (-1);
}
//
// operacion empaquetado. se crea un archivo en blanco; se recorre el 
//string de argumentos a empaquetar, separando cada path por separado
//y se los copia byte a byte
//
int emp_pack(const char* arg_pack, const char *arg_output){
	
	printf("Se empaquetaran los archivos..\n");fflush(stdout);		

	char campo[128]; campo[0]='\0';
	int cont= 0;
	int i = 0;
	emp_main_hd_t* headerMain = (emp_main_hd_t*) malloc(sizeof(emp_main_hd_t));
	emp_file_hd_t* headerFile = (emp_file_hd_t*) malloc(sizeof(emp_file_hd_t));
	int longitud = strlen(arg_pack);
	FILE *nArch, *auxArch;
	nArch = fopen(arg_output,"wb");
	
	if (nArch == NULL)
		emp_error(2);

	*headerMain = init_main_hd();
	in_main_hd(*headerMain,nArch);
	while (i < longitud){

		do {
			strncat(campo,&arg_pack[i],1);
			i++;
		}while ((arg_pack[i] != '$') && (i<longitud));

		if (arg_pack[i] == '$'){
			auxArch = fopen(campo,"rb");

			if (auxArch == NULL)
				emp_error(2);

			*headerFile = init_file_hd(campo);	

			if (in_file_hd(*headerFile,nArch,auxArch)==1)
				cont++;

			printf("--Archivo (%s) empaquetado--\n",headerFile->path);fflush(stdout);

			}
			campo[0]='\0';
			i++;
	}
	
	headerMain->entries = cont;
	in_main_hd(*headerMain,nArch);

	fclose(nArch);
	fclose(auxArch);

	printf("\n----Archivo .emp creado----\n");

	return 0;
}
	/*	
int emp_upack(const char *arg_upack, const char *arg_input, const char *arg_outputdir)	//Por el momento solo desempaqueta en la misma carpeta
{
	char c;
	char* campo[128] = "";
	unsigned char buffer[4096] = "";
	int ok = 0;
	int contador = 0;
	int i = 0;
	int x = 0;
	emp_main_hd_t* headerMain;
	emp_file_hd_t* headerFile;

	FILE* in,out;
	
	in = fopen(arg_input,"rb");	//Abro el archivo emp
	out_main_hd(headerMain,in);	//Obtengo el registro principal

	while (i < strlen(arg_upack)) do
	{
		do
		{
			strcat(campo,arg_upack[i++]);

		} while (i < strlen(arg_upack) && (c != '$');	//Obtengo el primer nombre del archivo que quiero sacar

		i++;
		out_file_hd(headerFile,in); //Obtengo el registro de un archivo dentro del emp

		if ((strcmp(campo,headerFile.path) != 0) //Comparo si es igual al que quiero desempaquetar
		{
			out = fopen(campo,"wb");

			for (int x = 0; x < headerFile.fsize; x++)
			{
			    fread(buffer, 1, headerFile.fsize, in);		//Copio el archivo a retirar
			    fwrite(buffer, 1, headerFile.fsize, out);
			}
			contador++;			
		}	
		fclose(out);				 
	}

	fclose(in);
	return contador;
}
*/
//
// operacion desempaquetado. se abre el archivo .emp y se lo recorre por 
//cantidad de entradas, devuelta, creando y copiando byte a byte cada nuevo 
//archivo
//
int emp_uapack(const char *arg_input, const char *arg_outputdir)//Por el momento solo desempaqueta en la misma carpeta
{
	printf("Se va a desempaquetar %s\n",arg_input);fflush(stdout);

	char campo[128];campo[0]='\0';
	char path[128];path[0]='\0';
	struct stat st;
	char buffer[1];
	int contador = 0;
	int j = 0;
	int i = 0;
	int flag = 1;
	if (arg_outputdir[0] == '\0') flag = 0;

	emp_main_hd_t* headerMain = (emp_main_hd_t*) malloc(sizeof(emp_main_hd_t));
	emp_file_hd_t* headerFile = (emp_file_hd_t*) malloc(sizeof(emp_file_hd_t));
	FILE *in,*out;

	strcpy(campo,arg_outputdir);
	//printf("DBG flag: %d || campo: %s || existe: %d\n",flag,campo,(stat(campo,&st)));fflush(stdout);

	if (flag == 1){	
		if (stat(campo,&st) != 0)
			emp_error(4);
		strcat(campo,"/tmp");
		mkdir(campo);

		strcpy(path,campo);
		strcat(path,"/");
	}

	*headerMain = init_main_hd();
	in = fopen(arg_input,"rb");	//Abro el archivo emp
	
	if (in == NULL)
		emp_error(3);

	out_main_hd(headerMain,in);	//Obtengo el registro principal
	
	for (j = 0;j < headerMain->entries;j++) 
	{
		out_file_hd(headerFile,in); //Obtengo el registro de un archivo dentro del emp
		campo[0] = '\0';
		if (flag == 1)			
			strcat(campo,path);
		
		strcat(campo,headerFile->path);
		out = fopen(campo,"wb");

		//printf("\nDBG %s\n",campo);fflush(stdout);

		for (i = 0; i < headerFile->fsize; ++i)
		{
			fread(buffer,1,1,in);	
		    fwrite(buffer,1,1,out);
		}	
			
		contador++;
		fclose(out);

		printf("--Archivo (%s) desempaquetado--\n",headerFile->path);	
	}

	fclose(in);





	printf("----Archivo %s.emp desempaquetado en ",arg_input);fflush(stdout);
	if (flag == 1)
	{
		strcat(path,"..----");
		printf("%s\n",path);
	}
	else
		printf("en su carpeta de origen----\n");

	return contador;
}

/*
int emp_list(const char *arg_list, const char *arg_input)
{ 
	char campo[128] = "";
	unsigned char buffer[8192];
	int ok = 0;contador = 0;i = 0;
	emp_main_hd_t* headerMain;
	emp_file_hd_t* headerFile;
	FILE* in,out;


	fseek(in,0,SEEK_END);
	int longitud= ftell(in);
	fseek(in,0,SEEK_SET);
	
	in = fopen(arg_input,"rb");	//Abro el archivo emp
	out_main_hd(headerMain,in);	//Obtengo el registro principal

	switch(arg_input){

		case 'name':
			char* arreglo[headerMain.entries];

			for (int i = 0; i < longitud; ++i)
			{
				out_file_hd(headerFile,arg_input);	//Obtengo el registro cabecera del archivo
				strcat(arreglo[i],headerFile.path); //Copio el nombre al arreglo
				fseek(in,headerFile.fsize,SEEK_CUR); //Me posiciono en el siguiente archivo
			}



		break;
		case 'size':

		break;
		case 'date':

		break;
	}

}*/


