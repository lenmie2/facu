#include "operations.h"

long process_operation(struct option_args *optargs) {
  long result = 0;
  int current_operand;

  switch (optargs->operation) {
    case ADDITION:
      printf("Sumando...\n");
      for (current_operand = 0; current_operand < (optargs->operands).used; current_operand++) {
        result += (optargs->operands).array[current_operand];
      }
      break;
    case SUBSTRACTION:
      printf("Restando...\n");
      result = (optargs->operands).array[0];
      for (current_operand = 1; current_operand < (optargs->operands).used; current_operand++) {
        result -= (optargs->operands).array[current_operand];
      }
      break;
    case MULTIPLICATION:
      printf("Multiplicando...\n");
      for (result = 1, current_operand = 0; current_operand < (optargs->operands).used; current_operand++) {
        result *= (optargs->operands).array[current_operand];
      }
      break;
  }
  return result;
}