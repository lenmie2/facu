#ifndef _ARGS_H
#define  _ARGS_H 1

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define  ADDITION       1
#define  SUBSTRACTION   2
#define  MULTIPLICATION 3

enum {
  ADD_I,
  SUB_I,
  MUL_I,
  OPTLEN,
};

struct operands_array {
  int *array;
  size_t used;
  size_t size;
};

struct option_args {
  unsigned operation;
  struct operands_array operands;
  int noperands;
};

struct option_args *parse_args(int argc, char **argv);

#endif