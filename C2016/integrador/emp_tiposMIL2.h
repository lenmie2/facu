#ifndef _EMP_TIPOS_H

#define _EMP_TIPOS_H  1



#include <stdint.h>

#include <sys/types.h>

#include <sys/stat.h>

#include <time.h>

#include <stdio.h>



typedef struct

{

  int act;

  int a;

  int p;

  int u;

  int d;

  int r;

  int l;



}t_flagOP;



typedef struct

{

  int i;

  int o;



}t_flagIO;



typedef struct {

  char          magic[3];

  unsigned char version;

  uint32_t      entries;

  uint64_t      resv1;

  uint64_t      resv2;

} emp_main_hd_t;





typedef struct {

  uint64_t    fsize;

  time_t      epoch;

  uint64_t    resv1;

  uint64_t    resv2;

  char        path[128];

}  emp_file_hd_t;

typedef struct {
  char*      dato;
  elemento*  siguiente;
} elemento;

typedef struct {
  elemento *inicio;
  elemento *fin;
  int tamaño;
} lista;

void inicializacion (lista* lista);

int ins_en_lista_vacia (lista* lista, char* dato); //La función retorna 1 en caso de error, si no devuelve 0

int ins_fin_lista (lista* lista, elemento* actual, char* dato);//La función da 1 en caso de error, si no devuelve 0 



t_flagOP init_flagOP(); //Inicializador del struct de flags de operaciones



t_flagIO init_flagIO(); //Inicializador del struct de flags de entrada/salida



emp_main_hd_t init_main_hd(); //Inicializador del struct headerMain



emp_file_hd_t init_file_hd(const char *path); //Inicializador del struct headerFile



int in_main_hd(emp_main_hd_t md, FILE *fpi); //Entra headerMain al .emp

 

int in_file_hd(emp_file_hd_t fd, FILE *fp, FILE *fpi); //Entra headerFile al .emp 



int out_main_hd(emp_main_hd_t* md, FILE *fp); //Sale headerMain del .emp



int out_file_hd(emp_file_hd_t* fd, FILE *fp); //Sale headerFile del .emp



#endif



/** EOF **/