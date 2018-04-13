/*Escribs un programa que copie caracteres del teclado en la pantalla
reemplazando cada ocurrencia de uno o mas espacios por solo uno.
Emplee getchar().*/

#include <stdio.h>

int main()
{

	char c,cp;
    c=getchar();
	while(c!=EOF){
		if(c==32){
			cp=c;
			putchar(cp);
			while((c!=EOF) && (c==32))
				c=getchar();
		}
		else{
            cp=c;
            putchar(cp);
            c=getchar();
        };
	}

	return 0;
}
