#include <stdio.h>

int main(int argc, char const *argv[])
{
	int c;

	c=getchar();	
	while (c != EOF){
		if (c == ' ') {
			putchar(c);
			while ((c != EOF) && (c == ' '))
				c=getchar();
			}
		else
			putchar(c);
			c=getchar();
	}

	return 0;
}