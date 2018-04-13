#ifndef _T_LIST_ITERATOR_H
#define _T_LIST_ITERATOR_H

/* El tipo de la lista */
#include "list.h"

typedef int t_list_index;

typedef struct {
  t_list list;
  t_list_index current;
} t_iterator;

/* Inicializa un iterador */
t_iterator    list_iterator_init(t_list);

/* Avanza un elmento en la lista */
void          list_iterator_next(t_iterator *);

/* Retorna el elemento actual en la lista */
t_data        list_iterator_data(t_iterator);

/* Indica si termino el recorrido */
short         list_iterator_end(t_iterator);

#endif

