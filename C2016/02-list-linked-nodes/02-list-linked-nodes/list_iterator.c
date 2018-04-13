#include "list_iterator.h"
#include <stdio.h>

t_iterator list_iterator_init(t_list l){
  t_iterator i;
  i.list = l;
  i.current = l;
  return i;
}

void list_iterator_next(t_iterator *i){
  i->current = i->current->next;
}

t_data list_iterator_data(t_iterator i){
  return i.current->data;
}

short list_iterator_end(t_iterator i){
  return i.current == NULL;
}

