#include <stdio.h>
#include "emp_tipos.h"
#include <string.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <time.h>

t_flagOP init_flagOP()
{
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
    
    char buf[] = "EMP";   
    strcpy(md.magic,buf);
    md.version = 5;
    md.entries = 0;
    md.resv1 = 0;
    md.resv2 = 0;

    return md;
}

emp_file_hd_t init_file_hd(const char *path){

    emp_file_hd_t fd;
    struct stat sInfo;
    stat(path,&sInfo);

    fd.fsize = sInfo.st_size;
    fd.epoch = sInfo.st_mtime;
    fd.resv1 = 0;
    fd.resv2 = 0;
    strcpy(fd.path,path);

//    printf("DBG path al crear: %s\n",path);

    return fd;
}

int in_main_hd(emp_main_hd_t md, FILE *fpi)
{
    fseek(fpi,0,SEEK_SET);
    fwrite(&md,sizeof(emp_main_hd_t),1,fpi);

   // printf("-----------Entries in_main_hd: %d\n",md.entries );

    return 0;
}

int in_file_hd(emp_file_hd_t fd, FILE *fp, FILE *fpi)
{
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

    return 0;
}

int out_file_hd(emp_file_hd_t* fd, FILE *fp)
{   
    fread(fd,sizeof(emp_file_hd_t),1,fp);

    return 0;
}

emp_file_hd_t* init_file_arr(FILE* emp)
{
    int x;
    emp_main_hd_t *headerMain = (emp_main_hd_t*) malloc(sizeof(emp_main_hd_t));
    emp_file_hd_t *headerFile = (emp_file_hd_t*) malloc(sizeof(emp_file_hd_t));
    
    fseek(emp,0,SEEK_SET);
    out_main_hd(headerMain,emp);

    emp_file_hd_t* arrHeader = malloc(headerMain->entries * sizeof(emp_file_hd_t));
    
    for (x = 0; x < headerMain->entries; x++)
    {
        out_file_hd(headerFile,emp);
        arrHeader[x] = *headerFile;
    
        if (feof(emp)==0)
            fseek(emp,headerFile->fsize,SEEK_CUR);
    }

    free(headerFile);
    free(headerMain);

    fseek(emp,0,SEEK_SET);
    return arrHeader;
}

emp_file_hd_t search_file_arr(const char *path, emp_file_hd_t* arrHeader,int entries)
{
    emp_file_hd_t *busq = (emp_file_hd_t*) malloc(sizeof(emp_file_hd_t));
    busq->epoch = 0;
    int i;

    for (i = 0; i < entries; ++i)
    {        
        if ((strcmp(arrHeader[i].path,path)) == 0)
            *busq = arrHeader[i];
    }

    return *busq;
}

int search_file(const char *path, FILE *emp,emp_file_hd_t* headerFile)
{   
    int i = 0;
    int succ = 0;
    emp_main_hd_t *headerMain = (emp_main_hd_t*) malloc(sizeof(emp_main_hd_t));

    fseek(emp,0,SEEK_SET);

    out_main_hd(headerMain,emp);

    while ( (i < headerMain->entries) && (succ == 0) )
    {   
        out_file_hd(headerFile,emp);     
        if ((strcmp(headerFile->path,path)) == 0)
            succ = 1;
        else
            fseek(emp,headerFile->fsize,SEEK_CUR);
        i++; 

    }

    free(headerMain);
    return succ;
}