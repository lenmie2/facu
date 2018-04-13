#include <stdio.h>
#define MAX(x,y) if (x > y) { \
		printf("%d es mas grande",x); \
		} else {	\
		printf("%d es mas grande",y); \
		}
#define MIN(x,y) if (x < y) { \
		printf("%d es mas chico",x); \
		} else {	\
		printf("%d es mas chico",y); \
		}

int main()
{
	int a,b;
    printf("Ingrese dos numeros enteros:");
    scanf("%d %d",&a,&b);
	MIN(a,b);

	return 0;

}
