#include "list.h"
#include <stdlib.h>

void list_create(t_list *l){
  l->data = NULL;
  l->size = 0;
}

short list_find(t_list l, t_data e){
unsigned long i;
  for (i=0; l.data[i] != e && i<l.size; i++);
  return i < l.size && l.data[i] == e;
}

short list_is_empty(t_list l){
  return l.size == 0;
}

t_data list_add(t_list *l, t_data e){
  l->data = realloc(l->data, sizeof(t_data) * ++l->size);
  return l->data[l->size-1] = e;
}

t_data  list_delete(t_list *l, t_data e){
unsigned long i;
  /* Busco el elemento */
  for (i=0; l->data[i] != e && i<l->size; i++);
  if (i < l->size && l->data[i] == e) {
    /* Si encontre el elemento... */
    for (; i<l->size; i++) l->data[i] = l->data[i+1];
    l->data = realloc(l->data, sizeof(t_data) * --l->size);
  }
  return e;
}

/* Libera las estructuras internas usadas por este tipo de dato */
void list_free(t_list *l) {
  free(l->data);
  l->size=0;
}
