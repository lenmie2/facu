/************************************************************
 *   
 * FILE NAME:   emp.c
 *
 * PURPOSE:     
 *
 * <purpose>           
 *
 * FILE REFERENCES:        
 *
 *            Name               I/O       Description             
 *            ----               ---       -----------
 * @file      <fname>            <i|o|io>  <fdesc>
 * 
 * EXTERNAL REFERENCES:
 *
 *            Name               I/O       Description             
 *            ----               ---       -----------
 * @external  <eref>             <i|o|io>  <edesc> 
 *
 * MAIN: 
 *
 * $Author:   
 *
 * $Revision: x.y$
 *
 * $Date:     YYYY/MM/DD$
 *
 * REQUIREMENTS/FUNCTIONAL SPECIFICATIONS:
 *
 * <freqs>
 *
 * NOTES:
 *
 * <notes>
 *
 * DEVELOPMENT HISTORY:
 *
 * Date        Author     Revision    Release   Description  
 * ----        ------     --------    -------   -----------
 * YYYY/MM/DD             x.y         -      
 *
 *	                                   
 ************************************************************/

#include <stdlib.h>                     /* exit */
#include <emp_codes.h>
#include <emp_args.h>
#include <emp_op.h>

int main(int argc, char *argv[])
{
   int  opt;
   char *arg_pack;
   char *arg_list;		    
   char *arg_det;	    
   char *arg_outdir;		    
   char *arg_output;		    
   char *arg_input;		    

   opt = parse_args(argc, argv, &arg_pack, &arg_list,  &arg_det, &arg_outdir, &arg_output, &arg_input);
   if (opt<=0)
  {
    usage(argv, EXIT_FAILURE);
  }
  switch(opt)
    {
    case ROP_PACK:
      emp_pack(arg_pack, arg_output);
      break;
    case ROP_RPACK:
       emp_rpack(arg_pack, arg_output);
      break;
    case ROP_UPACK:
       emp_upack(arg_pack, arg_input, arg_outdir);
      break;
    case ROP_UAPACK:
      emp_uapack(arg_input, arg_outdir);
      break;
    case ROP_LIST:
      emp_list(arg_list, arg_input);
      break;
    case ROP_DETAIL:
      emp_detail(arg_det, arg_input);
      break;
    case ROP_UNKNOWN:
      //emp_unknown();
      return EXIT_SUCCESS;
    case ROP_BAD:
      //emp_bad();
      return EXIT_FAILURE;
    }
  return EXIT_SUCCESS;
}

/*** EOF **/

