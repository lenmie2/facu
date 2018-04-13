#ifndef _BIN_TREE_H
#define _BIN_TREE_H


typedef int t_data;

typedef struct t_bin_tree_node {
  t_data data;
  struct t_bin_tree_node * left;
  struct t_bin_tree_node * right;
} t_bin_tree_node;

typedef struct t_bin_tree_node * t_bin_tree;

void    bin_tree_create(t_bin_tree *);
short   bin_tree_find(t_bin_tree , t_data);
short   bin_tree_is_empty(t_bin_tree );
t_data  bin_tree_add(t_bin_tree *, t_data);
void    bin_tree_destroy(t_bin_tree *);
void    bin_tree_print_post_order(t_bin_tree );
void    bin_tree_print_pre_order(t_bin_tree );
void    bin_tree_print_in_order(t_bin_tree );

#endif
