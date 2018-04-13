#include "bin_tree.h"
#include <stdio.h>
#include <stdlib.h>


void bin_tree_create(t_bin_tree *t) {
  *t = NULL;
}

short bin_tree_find(t_bin_tree t, t_data d) {
  if ( bin_tree_is_empty(t) ) return 0;
  if ( t->data == d) return 1;
  if ( t->data > d) return bin_tree_find(t->left, d);
  else return bin_tree_find(t->right, d);
}

short   bin_tree_is_empty(t_bin_tree t) {
  return t == NULL;
}

t_data bin_tree_add(t_bin_tree *t, t_data d) {
  if (bin_tree_is_empty(*t)) {
    *t = malloc (sizeof(struct t_bin_tree_node));
    (*t)->data = d;
    (*t)->left = (*t)->right = NULL;
    return d;
  }
  else {
    if ((*t)->data > d) return bin_tree_add(&((*t)->left), d);
    else return bin_tree_add(&((*t)->right), d);
  }
}

void  bin_tree_destroy(t_bin_tree * t) {
  if (!bin_tree_is_empty(*t)) {
    bin_tree_destroy(&((*t)->left));
    bin_tree_destroy(&((*t)->right));
    free(*t);
    *t = NULL;
  }
}

void bin_tree_print_in_order(t_bin_tree t) {
  if ( !bin_tree_is_empty(t) ) {
    bin_tree_print_in_order(t->left);
    printf("%d ",t->data);
    bin_tree_print_in_order(t->right);
  }
}

void bin_tree_print_pre_order(t_bin_tree t) {
  if ( !bin_tree_is_empty(t) ) {
    printf("%d ",t->data);
    bin_tree_print_pre_order(t->left);
    bin_tree_print_pre_order(t->right);
  }
}

void bin_tree_print_post_order(t_bin_tree t) {
  if ( !bin_tree_is_empty(t) ) {
    bin_tree_print_post_order(t->left);
    bin_tree_print_post_order(t->right);
    printf("%d ",t->data);
  }
}

