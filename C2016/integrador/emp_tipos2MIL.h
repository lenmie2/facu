#include <stdio.h>

#include "emp_tipos.h"

#include <string.h>

#include <stdlib.h>


void inicializacion (lista* lista){
  lista->inicio = NULL;
  lista->fin = NULL;
  tamaño = 0;
}

int ins_en_lista_vacia (lista* lista, char* dato){
	elemento* nodo;
  	if ((nodo = (elemento*) malloc (sizeof (elemento))) == NULL)
    		return 1;
  	if ((nodo->dato = (char*) malloc (50 * sizeof (char))) == NULL)
    		return 1;
 	strcpy (nodo->dato, dato);

  	nodo->siguiente = NULL;
  	lista->inicio = nodo;
 	lista->fin = nodo;
  	lista->tamaño++;
  	return 0;
}

int ins_fin_lista (lista* lista, elemento* actual, char* dato){
	elemento* nodo;
  	if ((nodo = (elemento*) malloc (sizeof (elemento*))) == NULL)
    		return 1;
  	if ((nodo->dato = (char*) malloc (50 * sizeof (char)))== NULL)
    		return 1;
  	strcpy (nodo->dato, dato);

  	actual->siguiente = nodo;
  	nodo->siguiente = NULL;

  	lista->fin = nodo;

  	lista->tamaño++;
  	return 0;
}



t_flagOP init_flagOP(){

    t_flagOP flags;



    flags.act = 0;

    flags.p = 0;

    flags.u = 0;

    flags.a = 0;

    flags.d = 0;

    flags.r = 0;

    flags.l = 0;



    return flags;

}



t_flagIO init_flagIO()

{



    t_flagIO flags;



    flags.i = 0;

    flags.o = 0;



    return flags;

}



emp_main_hd_t init_main_hd(){



    emp_main_hd_t md;   



    strcpy(md.magic,"EMP");

    md.version = '0';

    md.entries = 0;

    md.resv1 = 0;

    md.resv2 = 0;



    return md;

}



emp_file_hd_t init_file_hd(const char *path){



    emp_file_hd_t fd;

    

    FILE *arch;

    int longi;

    arch = fopen(path,"rb");



    fseek(arch,0,SEEK_END);

    longi = ftell(arch);

    fseek(arch,0,SEEK_SET);



//    fd = (emp_file_hd_t*) malloc (sizeof(emp_file_hd_t));



    fd.fsize = longi;

    fd.epoch = 0;

    fd.resv1 = 0;

    fd.resv2 = 0;

    strcpy(fd.path,path);



    printf("DBG path al crear: %s\n",path);



    return fd;

}



int in_main_hd(emp_main_hd_t md, FILE *fpi)

{

    fseek(fpi,0,SEEK_SET);

    fwrite(&md,sizeof(emp_main_hd_t),1,fpi);



    return 0;

}



int in_file_hd(emp_file_hd_t fd, FILE *fp, FILE *fpi)

{

    /*

    char buffer[4092];

    fwrite(&fd,sizeof(emp_file_hd_t),1,fp);





    fread(buffer,fd.fsize, 1, fpi); 

    fwrite(buffer, fd.fsize, 1, fp);



    printf("DBG path adentro de la funcion %s\n",fd.path);

*/

    char buffer[1];

    int i;



    fwrite(&fd,sizeof(emp_file_hd_t),1,fp);



    for (i = 0; i < fd.fsize; ++i)

    {

        fread(buffer,1, 1, fpi); 

        fwrite(buffer,1, 1, fp);

    }

        

    return 1;

}



int out_main_hd(emp_main_hd_t* md, FILE *fp)

{

    fseek(fp,0,SEEK_SET);

    fread(md,sizeof(emp_main_hd_t),1,fp);



    printf("DBG entries adentro del out_main_hd:%d\n",md->entries);

    fflush(stdout);



    return 0;

}



int out_file_hd(emp_file_hd_t* fd, FILE *fp)

{

    //char buffer[4092];

    

    fread(fd,sizeof(emp_file_hd_t),1,fp);



    //fread(buffer,fd.fsize, 1, fpi);    //Copio el archivo a retirar

    //fwrite(buffer, fd.fsize, 1, fp);

    

    return 0;



}

