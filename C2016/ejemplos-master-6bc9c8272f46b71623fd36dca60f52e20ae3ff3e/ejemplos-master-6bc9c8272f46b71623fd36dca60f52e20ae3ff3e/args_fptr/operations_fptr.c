#include "operations_fptr.h"

static long addition(long a, int b) {
  return a + b;
}

static long substraction(long a, int b) {
  return a - b;
}

static long multiplication(long a, int b) {
  return a * b;
}

long process_operation(struct option_args *optargs) {
  long result = 0;
  int current_operand = 0;
  long (*function_pointer)(long, int);

  switch (optargs->operation) {
    case ADDITION:
      printf("Sumando...\n");
      function_pointer = &addition;
      break;
    case SUBSTRACTION:
      printf("Restando...\n");
      result = (optargs->operands).array[0];
      current_operand = 1;
      function_pointer = &substraction;
      break;
    case MULTIPLICATION:
      printf("Multiplicando...\n");
      result = 1;
      function_pointer = &multiplication;
      break;
  }
  for (; current_operand < (optargs->operands).used; current_operand++) {
    result = (*function_pointer)(result, (optargs->operands).array[current_operand]);
  }
  return result;
}