#include <stdio.h>

char may2min(char a)
{

    if ((a >= 65) && (a <= 90)) then
        a = a + 32;
    return a;

}

int main()
{
    char m;

	printf("Ingrese caracter: ");
	scanf("%c",&m);
	printf("su caracter es: %c",m);
	may2min(m);
	printf(" y ahora su caracter es: %c",m);
	return 0;
}
