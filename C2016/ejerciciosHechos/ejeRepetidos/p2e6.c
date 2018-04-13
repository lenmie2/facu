#include <stdio.h>

int main(int argc, char const *argv[])
{
	int c;
	c=getchar();
	while (c != EOF) {
		if (c == '\\')
			c = '\\\\';
		else if (c == '	')
			c = '\\t';
		else if (c == '
			')
			c = '\\n';
		putchar(c);
	}
	return 0;
}