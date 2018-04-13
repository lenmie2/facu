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
// funcion help
//
void emp_uso()
{
	printf("\nuso:	{--pack|-p}   <lista de archivos a empaquetar> {--output|-o} archivo.emp \n");
	printf("        {--repack|-r} <lista de archivos a reempaquetar> {--output|-o} archivo.emp \n");
	printf("        {--unpack|-u} <lista de archs a desempaquetar> {--input|-i} archivo.emp [dir out/tmp]\n");
	printf("        {--unpackall|-a}              {--input|-i} archivo.emp [""direccion de output""/tmp] \n");
	printf("        {--list|-l}  [name|date|size] {--input|-i} archivo.emp \n");
	printf("        {--detail|-d} <archivo dentro del .emp a detallar>  {--input|-i} archivo.emp \n");
	printf("\n     ((las listas de archivos no deben contener el simbolo $))\n");
	exit(0);
}
//
// funcion error, la idea es que se pasa por parametro el tipo de error que tubo y lo procesa de acuerdo 
//
int emp_error(int tipo)		
{
	switch (tipo)
	{
		case 1:
			fprintf(stderr, "Error - argumentos invalidos\n Utilize la opcion -h --help para ayuda");
			break;
		case 2:
			fprintf(stderr, "Error - no se encontro el archivo a empaquetar");
			break;
		case 3:
			fprintf(stderr, "Error - no se encontro el archivo a desempaquetar");
			break;
		case 4:
			fprintf(stderr, "Eror - archivo o directorio no existe");
			break;
		case 5:
			fprintf(stderr, "Error - archivo no es de tipo emp");
			break;
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
int emp_pack(const char* arg_pack, const char *arg_output)
{
	printf("\nSe empaquetaran los archivos..\n");fflush(stdout);		

	char buffer[128]; buffer[0]='\0'; //
	int cont= 0;
	int i = 0;
	int longitud = strlen(arg_pack);

	emp_main_hd_t* headerMain = (emp_main_hd_t*) malloc(sizeof(emp_main_hd_t));
	emp_file_hd_t* headerFile = (emp_file_hd_t*) malloc(sizeof(emp_file_hd_t));
	
	FILE *out, *in;
	out = fopen(arg_output,"wb");

	*headerMain = init_main_hd();
	in_main_hd(*headerMain,out);

	while (i < longitud){

		do {
			strncat(buffer,&arg_pack[i],1);
			i++;
		}while ((arg_pack[i] != '$') && (i<longitud));

		if (arg_pack[i] == '$'){
			in = fopen(buffer,"rb");
			if (in == NULL)
				emp_error(2);

			*headerFile = init_file_hd(buffer);	
			in_file_hd(*headerFile,out,in);
			cont++;

			printf("--Archivo (%s) empaquetado--\n",headerFile->path);fflush(stdout);

			}
			buffer[0]='\0';
			i++;
	}
	
	headerMain->entries = cont;
	in_main_hd(*headerMain,out);

	fclose(out);
	fclose(in);

	free(headerMain);
	free(headerFile);

	printf("\n----Archivo empaquetado %s creado----\n",arg_output);

	return 0;
}
//
//funcion reempaquetar se abre un archivo existente y se agrega archivos especificados
//
int emp_rpack(const char *arg_rpack, const char *arg_output)
{
	
	printf("Se Reempaquetaran los archivos..\n");fflush(stdout);		

	char campo[128]; campo[0]='\0';
	int cont= 0;
	int i = 0;
	emp_main_hd_t* headerMain = (emp_main_hd_t*) malloc(sizeof(emp_main_hd_t));
	emp_file_hd_t* headerFile = (emp_file_hd_t*) malloc(sizeof(emp_file_hd_t));
	int longitud = strlen(arg_rpack);
	FILE *out, *in;
	
	out = fopen(arg_output,"rb");
	if (out == NULL)
		emp_error(4);


	out_main_hd(headerMain,out);

	/*
	printf("DBG headerMain:%s\n",headerMain->magic);fflush(stdout);
	if ((strcmp(headerMain->magic,"EMP")) != 0){
		printf("%s y EMP no son iguales\n",headerMain->magic);fflush(stdout);
		emp_error(5);
	}
*/
	fclose(out);

	out = fopen(arg_output,"ab+");
	fseek(out,0,SEEK_END);
	while (i < longitud){

		do {
			strncat(campo,&arg_rpack[i],1);
			i++;
		}while ((arg_rpack[i] != '$') && (i<longitud));

		if (arg_rpack[i] == '$'){
			in = fopen(campo,"rb");

			if (in == NULL)
				emp_error(2);

			*headerFile = init_file_hd(campo);	

			if (in_file_hd(*headerFile,out,in)==1)
				cont++;

			printf("--Archivo (%s) reempaquetado--\n",headerFile->path);fflush(stdout);
			fclose(in);
			}
			campo[0]='\0';
			i++;
	}
	fclose(out);
	headerMain->entries = headerMain->entries + cont;

	out = fopen(arg_output,"rb+");
	fseek(out,0,SEEK_SET);
	fwrite(headerMain,sizeof(emp_main_hd_t),1,out);

	fclose(out);
	free(headerFile);
	free(headerMain);

	printf("\n----Archivo empaquetado %s reempaquetado----\n",arg_output);

	return 0;
}
//
//
//
int emp_upack(const char *arg_upack, const char *arg_input, const char *arg_outputdir)	//Por el momento solo desempaqueta en la misma carpeta
{
	int longitud = strlen(arg_upack);
	int i = 0;
	int j;
	int flag = 1;
	struct stat st;
	char buffer[1];	
	char campo[128];
	char path[128]; path[0] = '\0';

	emp_main_hd_t* headerMain = (emp_main_hd_t*) malloc(sizeof(emp_main_hd_t));
	emp_file_hd_t* headerFile = (emp_file_hd_t*) malloc(sizeof(emp_file_hd_t));


	FILE *out, *in;
	in = fopen(arg_input,"rb");
	if (in == NULL)
		emp_error(4);
	out_main_hd(headerMain,in);

/*
	if (strcmp(headerMain->magic,"EMP") != 0)
		emp_error(5);
*/		

	strcpy(campo,arg_outputdir);
	if (arg_outputdir[0] == '\0')
		flag = 0;
	else {
		flag = 1;
		if (stat(campo,&st) != 0) //si existe la dir
			emp_error(4);
		strcat(campo,"/tmp");
		mkdir(campo);

		strcpy(path,campo);
		strcat(path,"/");
	}

	printf("Se va a desempaquetar %s\n",arg_input);

	campo[0]='\0';
	while (i < longitud){
		do 
		{
			strncat(campo,&arg_upack[i],1);
			i++;
		}while ((arg_upack[i] != '$') && (i<longitud));
		//printf("i: %d  campo: %s\n",i,campo);fflush(stdout);
		if (arg_upack[i] == '$')
		{
			
			if ((search_file(campo,in,headerFile)) == 0)	//si no se encontro el archivo en el .emp
				emp_error(3);


			campo[0] = '\0';
			if (flag == 1)			//se resetea campo porque el valor 	
				strcat(campo,path); //encontrado ya esta en headerFile
		
			strcat(campo,headerFile->path);
			out = fopen(campo,"wb");

			for (j = 0; j < headerFile->fsize; ++j)
			{
				fread(buffer,1,1,in);	
			    fwrite(buffer,1,1,out);
			}	

			fclose(out);
			printf("--Archivo (%s) Desempaquetado--\n",headerFile->path);fflush(stdout);

		}		
		campo[0]='\0';
		i++;
	}

	printf("----Archivo desempaquetado en %s",arg_input);fflush(stdout);
	if (flag == 1)
	{
		strcat(path,"..----");
		printf("%s\n",path);
	}
	else
		printf("en su carpeta de origen----\n");

	return 0;

	fclose(in);
	free(headerFile);
	free(headerMain);

}
//
// operacion desempaquetado. se abre el archivo .emp y se lo recorre por 
//cantidad de entradas, devuelta, creando y copiando byte a byte cada nuevo 
//archivo
//
int emp_uapack(const char *arg_input, const char *arg_outputdir)//Por el momento solo desempaqueta en la misma carpeta
{
	char campo[128];campo[0]='\0';
	char path[128];path[0]='\0';
	struct stat st;
	char buffer[1];
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
		emp_error(4);

	out_main_hd(headerMain,in);	//Obtengo el registro principal
/*
	if (strcmp(headerMain->magic,"EMP") != 0)
		emp_error(5);
*/
	printf("Se va a desempaquetar %s..\n",arg_input);fflush(stdout);
	for (j = 0;j < headerMain->entries;j++) 
	{
		out_file_hd(headerFile,in); //Obtengo el registro de un archivo dentro del emp
		campo[0] = '\0';
		if (flag == 1)			
			strcat(campo,path);
		
		strcat(campo,headerFile->path);
		out = fopen(campo,"wb");

		for (i = 0; i < headerFile->fsize; ++i)
		{
			fread(buffer,1,1,in);	
		    fwrite(buffer,1,1,out);
		}	
			
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

	free(headerMain);
	free(headerFile);
	return 0;
}
//
//FALTAN LOS NANOSEGUNDOS.
//
int emp_list(const char *arg_list, const char *arg_input)
{ 
	int i;
	int j;
	int comp;
	int op;
	emp_main_hd_t* headerMain = (emp_main_hd_t*) malloc(sizeof(emp_main_hd_t));
	emp_file_hd_t* headerFile = (emp_file_hd_t*) malloc(sizeof(emp_file_hd_t));
	struct tm *tInfo;
    char buf[128];
	FILE* in;

	in = fopen(arg_input,"rb");	//Abro el archivo emp
	if (in == NULL)
		emp_error(4);
	out_main_hd(headerMain,in);	//Obtengo el registro principal
/*
	if (strcmp(headerMain->magic,"EMP") != 0)
		emp_error(5);
*/
	emp_file_hd_t* arrHFile;
	arrHFile = init_file_arr(in);

	if ((strcmp(arg_list,"name")) == 0)
		op = 1;
	else if ((strcmp(arg_list,"size")) == 0)
		op = 2;
	else if ((strcmp(arg_list,"date")) == 0)
    	op = 3;
	else
		emp_error(1);

	for (i = 0; i < headerMain->entries; ++i)
	{
		for (j = 0; j < headerMain->entries - 1; ++j)
		{
			switch(op){
				case 1: comp = strcmp(arrHFile[j].path,arrHFile[j+1].path);
					break;
				
				case 2: if (arrHFile[j].fsize > arrHFile[j+1].fsize)							comp= 1;
					else if (arrHFile[j].fsize < arrHFile[j+1].fsize)
						comp= -1;
					else 
						comp = 0;
					break;
				
				case 3: if (arrHFile[j].epoch < arrHFile[j+1].epoch)							comp= 1;
					else if (arrHFile[j].epoch > arrHFile[j+1].epoch)
						comp= -1;
					else 
						comp = 0;
					break;

				default:
					break;
						}

			if (comp > 0)
			{
				*headerFile = arrHFile[j];
				arrHFile[j] = arrHFile[j+1];
				arrHFile[j+1] = *headerFile;				
			}
		}
		
		switch(op){
			case 1: printf("%s\n",arrHFile[i].path);
					break;
			case 2: printf("%s %d B\n",arrHFile[i].path,(int)arrHFile[i].fsize);
					break;
			case 3: tInfo = localtime(&arrHFile[i].epoch);
    				strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S",tInfo);
    				printf("%s %s\n",arrHFile[i].path,buf);
					break;
			default:
					break;
			}
		
	}
	fclose(in);
	free(arrHFile);
	free(headerMain);
	free(headerFile);

	return 0;
}

int emp_detail(const char *arg_det, const char *arg_input)
{
	char buf[80];
	struct tm *tInfo;
	emp_file_hd_t headerFile; //localtime() no funciona con un puntero
	emp_main_hd_t* headerMain = (emp_main_hd_t*) malloc(sizeof(emp_main_hd_t));


	FILE* arch;
	int succ;
	arch = fopen(arg_input,"rb");
	if (arch == NULL)
		emp_error(4);

	out_main_hd(headerMain,arch);
/*
	if (strcmp(headerMain->magic,"EMP") != 0)
		emp_error(5);
*/
	succ = search_file(arg_det,arch,&headerFile);

	if (succ == 1)
	{
		tInfo = localtime(&headerFile.epoch);
		strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S",tInfo);
		printf("%s %s %dB\n",headerFile.path,buf,(int)headerFile.fsize);
	}
	else
		printf("--- Error Elemento no encontrado ---\n");

	return 0;

	free(headerMain);
	fclose(arch);
}

