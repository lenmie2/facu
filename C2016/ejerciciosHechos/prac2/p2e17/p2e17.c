#include <stdio.h>
int main(){
	int x = 1300;
	char buffer[4];
	printf("x = %d\n",x);
	fgets(buffer,4,stdin);
	printf("x = %d\n",x);
    puts(buffer);

	return 0;
}
