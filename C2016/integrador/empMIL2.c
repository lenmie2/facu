/* TRABAJO FINAL SEMINARIO C 2016 

-Alumnos: S. Encinas Javier DNI: 37021340 // Rucci Milagros LEG: 13995/7



 ESTADO DE LA APLICACION
      
    Parseo de Argumentos: FUNCIONAL
      Aun asi, por indicaciones de la ayudante, hay que reemplazar
      el parseo de los argumentos (strings separados por $)
      por una lista de strings

    Operaciones:
      *- pack: FUNCIONAL
      *- repack: NO FUNCIONAL
      *- unpack: NO FUNCIONAL
      *- unpack-all: FUNCIONAL!!
      *- list: NO FUNCIONAL
      *- detail: NO FUNCIONAL
      
      funcionales: 2. Pero la logica de copiado y pegado (leyendo y pegando de a un bit)
      resulta ineficiente. Buscar otra forma de hacerlo.

    Manejo de Errores: FUNCIONAL
      Se puede optimizar, imprimiendo en pantalla el origen del archivo en conflicto.
    
    Usage: NO FUNCIONAL
      No realizada. Pero se supone una funcion mas en emp_operaciones que imprima
      con el comando -h o --usage
*/

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include "emp_operaciones.h"
#include "emp_tipos.h"

/*
Sobre el parseo de argumentos: Se utilizan 2 structs de flags para
controlar que la cantidad de operaciones y argumentos pasados sea valida
*/

int main (int argc, char **argv) {
  int c;

  char buffer[128] = "";      //Va a tener todas los argumentos no opciones al final del switch
  char input[128] = "";       //Va a tener el input al final del switch
  char output[128] = "";      //Va a tener el output al final del switch;

  t_flagOP flagOP = init_flagOP();
  t_flagIO flagIO = init_flagIO();


  while (1)
    {
      static struct option long_options[] =
        {
          {"pack", required_argument, 0,'p'},
          {"unpack", required_argument, 0,'u'},
          {"repack",    required_argument,  0, 'r'},
          {"unpack-all",  required_argument,0, 'a'},
          {"detail",  required_argument, 0, 'd'},
          {"list",  required_argument, 0, 'l'},
          {"input",    required_argument, 0, 'i'},
          {"output",    required_argument, 0, 'o'},
          {0, 0, 0, 0}
        };
      /* getopt_long stores the option index here. */
      int option_index = 0;

      int index;
      char* next;

      c = getopt_long (argc, argv, "p:u:r:a:d:l:i:o:",
                       long_options, &option_index);

      if (c == -1)
        break;
	
      lista* lista;
      inicializacion (lista* lista);

      switch (c){
	      case 'p':
         	 if (flagOP.act != 1) {
            		flagOP.act = 1;
            		flagOP.p = 1;

            		index = optind-1;
			if (index <argc){
				next = strdup(argv[index]);
				if (next[0] != '-')
					ins_en_lista_vacia (lista* lista, char* next);
				index++
			}
           		while (index < argc){
              			next = strdup(argv[index]);
              			index++;
              			if (next[0] != '-')
				                    	ins_fin_lista (lista* lista, elemento* actual, char* next);
					 
               			else 
              				break;
           		 }

         	 } else
            		emp_error(1);
          
          	 break;

       		case 'u':
          	   if (flagOP.act != 1) {
           		 flagOP.act = 1;
            		 flagOP.u = 1;

            		index = optind-1;
            		if (index <argc){
				next = strdup(argv[index]);
				if (next[0] != '-')
					ins_en_lista_vacia (lista* lista, char* next);
				index++
			}
           		while (index < argc){
              			next = strdup(argv[index]);
              			index++;
              			if (next[0] != '-')
					ins_fin_lista (lista* lista, elemento* actual, char* next) //No estoy segura como funciona bien el actual
					 
               			else 
              				break;
            		}
          	    }else
            		emp_error(1);
            
          	break;

        	case 'r':
          		if (flagOP.act != 1){
           			flagOP.act = 1;
            			flagOP.r = 1;

           			index = optind-1;
           			if (index <argc){
					next = strdup(argv[index]);
					if (next[0] != '-')
						ins_en_lista_vacia (lista* lista, char* next);
					index++
				}
           			while (index < argc){
              				next = strdup(argv[index]);
              				index++;
              				if (next[0] != '-')
						ins_fin_lista (lista* lista, elemento* actual, char* next)
					 
               				else 
              					break;
            			}
         		}else
            			emp_error(1);
            
          	break;

        	case 'a':
         		 if (flagOP.act != 1){
            			flagOP.act = 1;
           			flagOP.a = 1;

            			index = optind-1;

            			if (index <argc){
					next = strdup(argv[index]);
					if (next[0] != '-')
						ins_en_lista_vacia (lista* lista, char* next);
					index++
				}
           			while (index < argc){
              				next = strdup(argv[index]);
              				index++;
              				if (next[0] != '-')
						ins_fin_lista (lista* lista, elemento* actual, char* next)
					 
               				else 
              					break;
           			}
          		}else
            			emp_error(1);
          	break;

        	case 'd':
         		 if (flagOP.act != 1){
            			flagOP.act = 1;
            			flagOP.d = 1;

           			index = optind-1;
            			if (index <argc){
					next = strdup(argv[index]);
					if (next[0] != '-')
						ins_en_lista_vacia (lista* lista, char* next);
					index++
				}
           			while (index < argc){
              				next = strdup(argv[index]);
              				index++;
              				if (next[0] != '-')
						ins_fin_lista (lista* lista, elemento* actual, char* next)
					 
               				else 
              					break;
            			}
          		}else
            			emp_error(1);

          	break;

        	case 'l':
         		if (flagOP.act != 1){
            			flagOP.act = 1;
            			flagOP.l = 1;

            			index = optind-1;
            			if (index <argc){
					next = strdup(argv[index]);
					if (next[0] != '-')
						ins_en_lista_vacia (lista* lista, char* next);
					index++
				}
           			while (index < argc){
              				next = strdup(argv[index]);
              				index++;
              				if (next[0] != '-')
						ins_fin_lista (lista* lista, elemento* actual, char* next)
					 
               				else 
              					break;
            			}
         		}  
            		else
               		       	emp_error(1);
            
            	break;

        	case 'i':
        		if (flagOP.act == 1){
          			flagIO.i = 1;

          			index = optind-1;
          			while (index < argc){
           				next = strdup(argv[index]);
           				index++;
            				if (next[0] != '-')
                				strcat(input,next);
           				else 
             					break;
         			}
        		}else
          			emp_error(1);  
        
        	break;

        	case 'o':
        		if (flagOP.act == 1){
          			flagIO.o = 1;

         			index = optind-1;
          			while (index < argc){
            				next = strdup(argv[index]);
           				index++;
            				if (next[0] != '-')
                				strcat(output,next);
            				else 
             					break;
          			}
        		}else
          			emp_error(1);
        	break;

       		case '?':
          		/* getopt_long already printed an error message. */
          	break;

        default:
          abort ();
        }
    }

//testo

  printf("\n DBG estado de flags:\n p:%d  \n a:%d\n r:%d\n u:%d\n l:%d\n d:%d\n i:%d\n o:%d\n",flagOP.p,flagOP.a,flagOP.r,flagOP.u,flagOP.l,flagOP.d,flagIO.i,flagIO.o);fflush(stdout);
  printf("\n DBG Estado de los buffers\n Path:%s\n I:%s\n O:%s \n ",buffer,input,output);fflush(stdout);

//endtesto

  if ( (flagOP.p == 1) && (flagIO.i == 0) && (flagIO.o == 1) ){
      emp_pack(buffer,output);}
  else if ( (flagOP.a == 1) && (flagIO.i == 0) ){  //cambiar el valor de las flags cuando se le implemente el outdir

    emp_uapack(buffer,output);}
/*
  if ( (flagOP.r == 1) && (flagIO.o == 1) && (flagIO.o == 0) ){
      emp_rpack(buffer,output);}
  if ( (flagOP.u == 1) && (flagIO.o == 1) && (flagIO.o == 1) ){
      emp_upack(buffer,input,output);}
  if ( (flagOP.d == 1) && (flagIO.o == 1) && (flagIO.o == 0) ){
      emp_detail(buffer,input);}
  if ( (flagOP.l == 1) && (flagIO.o == 1) && (flagIO.o == 0) ){
      emp_list(buffer,input);}
*/
  else
      emp_error(1);   






  return 0
;}