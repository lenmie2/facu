#include "list.h"
#include "list_iterator.h"
#include <stdio.h>
#define esta_vacia(lista) printf("La lista esta vacia?? %s\n", list_is_empty(lista)?"SI":"NO")
#define existe_elemento(lista, elem) printf("Existe el elemento %d?? %s\n", elem, list_find(lista,elem)?"SI":"NO")

int main(){
  t_data elems[]={1,2,3,4,5,6,7,8,9,10};
  unsigned i;
  t_list l;
  t_iterator it;
  list_create(&l);
  esta_vacia(l);
  for (i=0; i < 10; i++) {
    list_add(&l, elems[i]);
  }
  printf(">>> Luego de INSERTAR <<<\n");

  for (it=list_iterator_init(l); !list_iterator_end(it); list_iterator_next(&it))
  {
    printf("\t- %d\n", list_iterator_data(it));
  }

  esta_vacia(l);
  existe_elemento(l,1);
  existe_elemento(l,100);
  existe_elemento(l,10);
  existe_elemento(l,75);
  existe_elemento(l,5);
  for (i=0; i < 9; i++) {
    list_delete(&l, elems[i]);
  }
  printf(">>> Luego de ELIMINAR TODO MENOS EL ULTIMO ELEMENTO...<<<\n");
  for (it=list_iterator_init(l); !list_iterator_end(it); list_iterator_next(&it))
  {
    printf("\t- %d\n", list_iterator_data(it));
  }
  esta_vacia(l);
  list_delete(&l, 10);
  printf(">>> Luego de ELIMINAR TODO<<<\n");
  for (it=list_iterator_init(l); !list_iterator_end(it); list_iterator_next(&it))
  {
    printf("\t- %d\n", list_iterator_data(it));
  }
  esta_vacia(l);
  list_free(&l);
  return 0;
}
