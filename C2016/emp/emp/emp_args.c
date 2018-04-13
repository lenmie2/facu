#include <stdio.h>                      /* printf */
#include <stdlib.h>                     /* exit */
#include <getopt.h>                     /* getopt */
//#include <stdbool.h>                    /* Booleans */ No se usan
#include <string.h>                     /* strncmp */

/***
Si no se usa -I
#include "emp_args.h"
#include "emp_args.h"
***/

#include <emp_codes.h>
#include <emp_args.h>

extern char *optarg;
extern int optind, opterr, optopt;

#define OP_ARG_PACK        'p'
#define OP_ARG_PACK_LONG   "pack"

#define OP_ARG_RPACK       'r'
#define OP_ARG_RPACK_LONG  "repack"

#define OP_ARG_UPACK       'u'
#define OP_ARG_UPACK_LONG  "unpack"

#define OP_ARG_LIST        'l'
#define OP_ARG_LIST_LONG   "list"

#define OP_ARG_DET         'd'
#define OP_ARG_DET_LONG    "detail"

#define OP_ARG_OUTPUT       'o'
#define OP_ARG_OUTPUT_LONG  "output"

#define OP_ARG_OUTPUTDIR      't'
#define OP_ARG_OUTPUTDIR_LONG "outputdir"

#define OP_ARG_INPUT       'i'
#define OP_ARG_INPUT_LONG  "input"

#define OP_UAPACK      'a'
#define OP_UAPACK_LONG "unpackall"


#define OP_HLP             'h'
#define OP_HLP_LONG        "help"

#define OPTION_STRING "p:u:r:l:d:o:i:ah"

static struct option long_options[] = 
              {
              {OP_ARG_PACK_LONG,      required_argument, 0, (int) OP_ARG_PACK  },
              {OP_ARG_RPACK_LONG,     required_argument, 0, (int) OP_ARG_RPACK },
//            {OP_ARG_..., ..., 0, ..., ... }, Completar con varias entradas
//            {OP_ARG_..., ..., 0, ..., ... },
              {OP_ARG_INPUT_LONG,     required_argument, 0, (int) OP_ARG_INPUT },
              {OP_UAPACK_LONG,        no_argument,       0, (int) OP_UAPACK },
              {OP_HLP_LONG,           no_argument,       0, (int) OP_HLP },
              {0, 0, 0, 0}
              };


#define DEFAULT_OPT_ARG_PACK       (NULL) 
#define DEFAULT_OPT_ARG_LIST	   "name"	    	    		    
//#define  Completar otros define para los DEFAULT

static size_t strlen_null(const char *s)
{
  if (s == NULL)
    return 0;
  else
    return strnlen(s, MAX_PATH_LEN);
}

static char *strcat_stuff(char *dest, const char *src, const char *stuff)
{
  // Completar si se utiliza 
}

/***
 * Modo de uso y sale
 */
void usage(char *argv[], int code)
{
 printf("uso:    {--pack|-p}   <lista de archivos a empaquetar> {--output|-o} archivo.emp \n");
 printf("        {--repack|-r} <lista de archivos a reempaquetar> {--output|-o} archivo.emp \n");
 printf("        {--unpack|-u} <lista de archivos a desempaquetar> {--input|-i} archivo.emp [""direccion de output""/tmp] \n");
 printf("        {--unpackall|-a}              {--input|-i} archivo.emp [""direccion de output""/tmp] \n");
 printf("        {--list|-l}  [name|date|size] {--input|-i} archivo.emp \n");
 printf("        {--detail|-d} <archivo dentro del .emp a detallar>  {--input|-i} archivo.emp \n");
 exit(0);
}

/***
 * Parsea argumentos
 */
int parse_args(/*@ in @*/  int  argc, 
	       /*@ in @*/  char *argv[],
	       /*@ out @*/ char **arg_pack,	    
	       /*@ out @*/ char **arg_list,		    
	       /*@ out @*/ char **arg_det,		    
	       /*@ out @*/ char **arg_outdir,		    
	       /*@ out @*/ char **arg_output,		    
	       /*@ out @*/ char **arg_input)		    
{
     int  res;
     int arg_pack_count      = 0;
     int arg_rpack_count     = 0;
     int arg_upack_count     = 0;
     int arg_upackall_count  = 0;
     int arg_list_count      = 0;
     int arg_det_count       = 0;
     int arg_outdir_count    = 0;
     int arg_output_count    = 0;
     int arg_input_count     = 0;

     opterr           = 0; // Supress getopt errors
     *arg_pack        = DEFAULT_OPT_ARG_PACK;
     *arg_list        = DEFAULT_OPT_ARG_LIST;		    	    		    
     *arg_det	      = DEFAULT_OPT_ARG_DET;		    	    		    	    
     *arg_outdir      = DEFAULT_OPT_ARG_OUTDIR;		    
     *arg_output      = DEFAULT_OPT_ARG_OUTPUT;		    	    
     *arg_input       = DEFAULT_OPT_ARG_INPUT;		    	    

     // while ( (res = getopt(argc, argv, OPTION_STRING)) != -1 ) Solo usada si se admiten argumentos cortos
     while ( (res = getopt_long(argc, argv, OPTION_STRING, long_options, NULL)) != -1 )
     {
      if  (res == (int) OP_ARG_PACK)
	{	 
	  int index = optind - 1; // Comienzo de parámetros variables de --pack
          arg_pack_count++;
          // Procesa los parametros para --pack/-p y los concatena en un string
          // separado por "$"
          // Una mejor opcion seria colocarlos en una lista o un arreglo
	  while(index < argc)
	    {
              *arg_pack = realloc( *arg_pack, strlen_null(*arg_pack) + 2 + strlen_null(argv[index]) );
              strcat_stuff(*arg_pack, argv[index], "$");   
	      index++;
	      if ( (index<argc) && ((argv[index])[0] == '-') )
		{         
		  optind = index - 1; // Fin de parámetros de --pack
		  break;
		}
	    }
	}
      else if  (res == (int) OP_ARG_RPACK)
	{
	  // Completar
	}
      else if  (res == (int) OP_ARG_UPACK)
	{
          // Completar
	}
      //else if  (res == ... )
      // Completar con el resto de las opciones
      //else if  ( ...)
     else if  (res == (int) OP_ARG_INPUT)
	{
          *arg_input = optarg;
	  arg_input_count++;
	}
      else if  (res == (int) OP_HLP)
	{
	  return ROP_UNKNOWN;
	}
      else 
	{ 
          // Invalid Option, res ==  '?' 
	  return ROP_BAD;
	}
     }
     // Excesive arguments
     if ( (arg_pack_count>1) || //... Completar
              
       {
	 return ROP_BAD;	  
       }
     // Pack Option
     if ( (arg_pack_count==1)&&(arg_output_count==1)&& 
          ( ! ( (arg_rpack_count) || (arg_upack_count)  || (arg_upackall_count) || (arg_list_count) ||
		(arg_det_count)   || (arg_outdir_count) || (arg_input_count) ) ) )
       {
	 return ROP_PACK;
       }
     // Re-Pack Option
     else if ( (arg_rpack_count==1)&&(arg_output_count==1)&& //... Completar
     //...
     // Unpack Option
     else if 
     //... Completar 
     // Unpack-all Option
     //... Completar
     // List Option
     //... Completar
     // Detail Option
     //... Completar
     else
       {
	 return ROP_UNKNOWN;
       }
}

/*** EOF **/

