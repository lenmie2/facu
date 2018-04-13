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

int init_main_hd(emp_main_hd_t *md);

int init_file_hd(emp_file_hd_t *fd, const char *path);

int out_main_hd(emp_main_hd_t *md, FILE *fp);

int out_file_hd(emp_file_hd_t *fd, FILE *fp);

int in_main_hd(emp_main_hd_t *md, FILE *fpi);

int in_file_hd(emp_file_hd_t *fd, FILE *fp, FILE *fpi);

#endif

/** EOF **/
