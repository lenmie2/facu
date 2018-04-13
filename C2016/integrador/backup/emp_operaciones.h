#ifndef _EMP_OPERACIONES_H
#define _EMP_OPERACIONES_H   1

int emp_pack(const char *arg_pack, const char *arg_output);

/*
int emp_rpack(const char *arg_rpack, const char *arg_output);

int emp_upack(const char *arg_upack, const char *arg_input, const char *arg_outputdir);
*/
int emp_uapack(const char *arg_input);//, const char *arg_outputdir); //quitar cuando se implemente outputdir
/*
int emp_list(const char *arg_list, const char *arg_input);

int emp_detail(const char *arg_det, const char *arg_input);
*/      
int emp_error();
#endif

/** EOF **/
