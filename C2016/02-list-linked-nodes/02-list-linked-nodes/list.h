#ifndef _T_LIST_H
#define _T_LIST_H

typedef int t_data;

typedef struct t_list_node {
  struct t_list_node *next;
  t_data data;
} * t_list;

typedef struct t_list_node t_list_node;


/* Crea una nueva lista, que puede usarse de inmediato */
void    list_create(t_list *);

/* Busca eun elemento en la lista y retorna verdadero si existe */
short   list_find(t_list, t_data);

/* Devuelve verdadero si la lista está vacía */
short   list_is_empty(t_list);

/* Agrega un elemento a la lista. Luego lo retorna */
t_data  list_add(t_list *, t_data );

/* Elimina un elemento de la lista y luego lo retorna */
t_data  list_delete(t_list *, t_data);

/* Libera las estructuras internas usadas por este tipo de dato */
void    list_free(t_list *);

#endif

