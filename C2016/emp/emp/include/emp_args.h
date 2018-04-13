#ifndef _EMP_ARGS_H
#define _EMP_ARGS_H 1

/**
 * Usage Message
 */

void usage(char *argv[], int code);

/**
 * Parse Common arguments
 */
int parse_args(/*@ in @*/  int  argc, 
	       /*@ in @*/  char *argv[],
	       /*@ out @*/ char **arg_pack,		    
	       /*@ out @*/ char **arg_list,		    
	       /*@ out @*/ char **arg_det,		    
	       /*@ out @*/ char **arg_outdir,		    
	       /*@ out @*/ char **arg_output,		    
	       /*@ out @*/ char **arg_input);

#endif

/*** EOF **/

