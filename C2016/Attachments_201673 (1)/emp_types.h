#ifndef _EMP_TYPES_H
#define _EMP_TYPES_H  1

#include <stdint.h>
#include <sys/types.h>
#include <sys/stat.h>
//#include <time.h>
#include <stdio.h>

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
  char        *path;
}  emp_file_hd_t;

int init_main_hd(emp_main_hd_t *md);			//inicializa registro cabecera del emp

int init_file_hd(emp_file_hd_t *fd, const char *path);		//inicializa registro cabecera de un archivo perteneciente al emp

int out_main_hd(emp_main_hd_t *md, FILE *fp);		//devuelve un registro cabecera del emp

int out_file_hd(emp_file_hd_t *fd, FILE *fp);		//devuelve un registro cabecera de un archivo..

int in_main_hd(emp_main_hd_t *md, FILE *fpi);		//ingresa un registro cabecera tipo emp al emp

int in_file_hd(emp_file_hd_t *fd, FILE *fp, FILE *fpi);		//ingresa un registro cabecera tipo archivo al emp

#endif

/** EOF **/
