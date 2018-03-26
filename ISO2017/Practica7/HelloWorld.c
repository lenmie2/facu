#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
void print_message_function( void *ptr );
int main() {
    printf("Inicia el main \n");
    pthread_t thread1, thread2;
    char *message1="Hola";
    char *message2="Mundo";
    pthread_create(&thread1, NULL, (void*)&print_message_function, message1);
    pthread_create(&thread2, NULL, (void*)&print_message_function, message2);
    exit(0);
}
void print_message_function( void *ptr ) {
    char *message;
    message=(char*)ptr;
    printf("%s \n",message);
}
