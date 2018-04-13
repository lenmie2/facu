#include <stdlib.h>
#include <stdint.h>
#include "args.h"
#include "operations.h"
#include "operations_fptr.h"

int main(int argc, char **argv){
  struct option_args *optargs = parse_args(argc, argv);
  long total = process_operation(optargs);

  printf("El resultado de la operación es: %ld", total);

  free(optargs);
  return EXIT_SUCCESS;
}
