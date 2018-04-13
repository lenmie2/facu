#include "args.h"

char *longopts[] = {
  "--add",
  "--sub",
  "--mul"
};

char *shortopts[] = {
  "+",
  "-",
  "*"
};

static void help(const char *progname){
  printf("Uso:\n");
  printf("\t%s --add numero [numero [numero...]]\n", progname);
  printf("\t%s --sub numero [numero [numero...]]\n", progname);
  printf("\t%s --mul numero [numero [numero...]]\n", progname);
}

static void error(const char *msg) {
  fprintf(stderr, "Error: %s\n", msg);
  exit(1);
}

static void init_operands_array(struct operands_array *a, int initial_size) {
  a->array = (int *)malloc(initial_size * sizeof(int));
  a->size = initial_size;
  a->used = 0;
}

static void insert_operand(struct operands_array *a, int operand) {
  if (a->used == a->size) {
    a->size *= 2;
    a->array = (int *)realloc(a->array, a->size * sizeof(int));
  }
  a->array[a->used++] = operand;
}

static void free_operands_array(struct operands_array *a) {
  free(a->array);
  a->array = NULL;
  a->used = 0;
  a->size = 0;
}

struct option_args *parse_args(int argc, char **argv) {
  struct option_args *optargs = calloc(1, sizeof(struct option_args));
  optargs->operation = 0; // Operación no especificada
  init_operands_array(&optargs->operands, 1);

  int operands = 0;
  int operand;

  for (int i = 1; i < argc; i++) {
    int optindex;
    unsigned short is_operation = 0;

    for (optindex = 0; optindex < OPTLEN; optindex++) {
      if (strcmp(argv[i], longopts[optindex]) == 0 || strcmp(argv[i], shortopts[optindex]) == 0) {
        // Es una operación -- sólo permitimos especificar una
        if (optargs->operation > 0) {
          error("No se puede especificar más de una operación (--add, --sub o --mul)");
        }
        optargs->operation = optindex + 1;
        is_operation = 1;

        printf("Operación: %s\n", longopts[optindex]);
        break;
      }
    }

    if (optindex == OPTLEN && !is_operation) {
      // No es una acción, debe ser un número
      operand = atoi(argv[i]);

      // Si operand es 0, quiere decir que hubo un error en la conversión, o que vino un 0 de argumento.
      // En ambos casos, el operando es neutro y por eso lo ignoramos.
      if (operand != 0) {
        operands++;
        insert_operand(&optargs->operands, operand);
        printf("Operando: %d\n", operand);
      } else {
        printf("Valor ignorado: %s\n", argv[i]);
      }
    }
  }

  if (optargs->operation == 0) {
    help(argv[0]);
    free_operands_array(&optargs->operands);
    free(optargs);
    exit(1);
  }

  optargs->noperands = operands;
  return optargs;
}
