#include <stdio.h>
int main(){

char uno()
{
	char c;
	c = 'A' + 2;
	return (c); //Retorna 'C'(67)
}

//11
int dos()
{
	int a= 10;
	return ((a++ == 10)?a:--a); //Retorna 11, no entiendo porque, deberia retornar 10
}

// 3 + 4.5
float tres()
{
	//lossless automatic casting
	float x= (int) 3.7 + 4.5;
	return x; //Retorna 7.5, ya que al aplicar (int) al 3.7, lo trunca

}

float tres2()
{
	int x = 3 + 4.5;
	return (float) x; //Retorna 1 aunque para mi deberia retornar 8.0000
}

// 3
int cuatro()
{
	float x= 3.6;
	return (int)x; //Retorna 3
}

//18 mod 3 = 0; b> 1= false= 0
int cinco()
{
	int a= 17, b;
	b= ++a % 3;

	return (b> 1); //Retorna 0 (falso)
}

//7654 3210 7654 3210
//a= 3 shift left 3 (0000 0011) (-> 0001 1000) = 24
int seis()
{
	int a= 3;
	a <<= 3; // a= a <<3;

	return a; //Retorna 24
}

//false(0)
int siete()

	unsigned a= 8, b; //Depends int rep
	b= ~a; // ~0000 0000 0000 1000 = 1111 1111 1111 0111

	return (b == 65535 - 8); //No deberia dar true(1)?
}

//true (1)
int siete2()
{
	unsigned short int a = 8, b; //Depends int rep
	b = ~a; // ~ 0000 0000 0000 1000 = 1111 1111 1111 0111

	return (b == 65535 - 8); // Retorna true(1) supongo que tiene que ver con el short int
}

// @
int ocho()
{
	int i = 320; // 0x0000 0140 40= 0x40 = 64 = '@'

	return char(i); // Retorna '@'
}

double nueve()
{
	char c = 'A'

	return (double) c; // Retorna 65
}

char nueve2()
{
	char c = 65;

	return (char) c; // Retorna 'A'
}

float nueve3()
{
	char c = 65;

	return (float) c; // Retorna 65? deberia retornar 65.00000
}

float diez()
{
	int c = 0xf0000000;

	return (float) c; // Retorna 1, supongo que es porque se trunca el valor Hex al asignarle como int
}

int diez2()
{
	int c = 0xf0000000;

	return (int) c; // Retorna 1, no tengo idea de como funciona esto
}

return 0;
}	