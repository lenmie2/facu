#include <stdio.h>
#define macro1(expr) printf(#
                            expr"=%g\n", expr)
#define macro2(uno, dos) uno ## dos

int main()
{
	int num;

	//char ch=macro2(ja, vier);
	//printf("%s",ch);


	printf("ingrese un numero: \n");
	//scanf("%e"),&num;
	num= 10;
	macro1(num);

	return 0;
}
