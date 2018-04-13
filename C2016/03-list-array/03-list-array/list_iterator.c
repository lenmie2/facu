#include "list_iterator.h"

t_iterator list_iterator_init(t_list l){
  t_iterator i;
  i.list = l;
  i.current = 0;
  return i;
}

void list_iterator_next(t_iterator *i){
  i->current++;
}

t_data list_iterator_data(t_iterator i){
  return i.list.data[i.current];
}

short list_iterator_end(t_iterator i){
  return i.current >= i.list.size;
}

