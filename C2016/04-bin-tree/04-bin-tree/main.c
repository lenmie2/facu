#include "bin_tree.h"
#include <stdio.h>

int main() {
 int i,ints [] = {10,1,100,3,2,5,6,9,0};
 t_bin_tree t;
printf(
"               \n"
"       10      \n"
"      /  \\    \n"
"    1     100  \n"
"     \\        \n"
"      3        \n"
"     / \\      \n"
"    2   5      \n"
"         \\    \n"
"          6    \n"
"           \\  \n"
"            9  \n"
"               \n");
 bin_tree_create(&t);
 printf("El arbol esta vacio? %s\n\n", bin_tree_is_empty(t)? "SI": "NO");
 for (i=0; ints[i]; i++) bin_tree_add(&t, ints[i]);
 printf("El arbol esta vacio? %s\n\n", bin_tree_is_empty(t)? "SI": "NO");
 printf("El elemento %d existe? %s\n\n", 6, bin_tree_find(t, 6) ? "SI":"NO");
 printf("El elemento %d existe? %s\n\n", 99, bin_tree_find(t, 99) ? "SI":"NO");
 printf("\nImprimimos en INORDER\n===================\n");
 bin_tree_print_in_order(t);
 printf("\nImprimimos en POSTORDER\n===================\n");
 bin_tree_print_post_order(t);
 printf("\nImprimimos en PREORDER\n===================\n");
 bin_tree_print_pre_order(t);
 return 0;
}
