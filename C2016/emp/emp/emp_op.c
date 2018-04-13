#include <stdio.h>

int  emp_pack(const char *arg_pack, const char *arg_output)
{
   // Completar
   return printf("Packing %s to %s\n",arg_pack,arg_output);
}

int emp_rpack(const char *arg_rpack, const char *arg_output)
{
  // Completar
  return printf("Repacking %s files into %s\n",arg_rpack,arg_output);
}

int emp_upack(const char *arg_upack, const char *arg_input, const char *arg_outputdir)
{
  // Completar
  return printf("Unpacking %s files from %s to %s\n",arg_upack,arg_input,arg_outputdir);
}

int emp_uapack(const char *arg_input, const char *arg_outputdir)
{
  // Completar
  return printf("Unpacking all files from %s to %s\n",arg_input,arg_outputdir);
}

int emp_list(const char *arg_list, const char *arg_input)
{
  // Completar
  return printf("Listing files by %s to %s\n",arg_list,arg_input);
}

int emp_detail(const char *arg_det, const char *arg_input)
{
  return printf("Details of file %s from %s\n",arg_det,arg_input);
}
      
int emp_unknown()
{
  // Completar
  return 0;
}

int emp_bad()
{
  // Completar
  return 0;
}

/** EOF **/
