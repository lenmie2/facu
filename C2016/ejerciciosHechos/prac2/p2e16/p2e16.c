#include <stdio.h>
#define mi_macro(t, a, b) (t _z##a##a##_##b = a; a = b ; b = _z##a##_ ##b )

int main()
{
	char a = "negro";
	char b = "hola";
	char c = "soy";
	mi_macro("hola",b,c);
	printf("%c\n",a);
	printf("%c\n",b);
	printf("%c\n",c);

	return 0;
}
