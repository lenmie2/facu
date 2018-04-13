#include  <stdio.h>
#include  <stdlib.h>

float area_cuadrado(float l)
{
	return(l*l);
}

float area_rectangulo(float b,float a)
{
	return(b*a);
}

float area_rombo(float may,float men)
{
	return(may*men);
}

float area_triangulo(float b,float a)
{
	return((b*a)/2);
}
// Para simplificar, consideramos que todos los números están expresados en centímetros.
int main() {
  printf("El área de un triángulo de base = 8.09 y altura = 12.113 es de %f\n",
         area_triangulo(8.09, 12.113));
  printf("El área de un rectángulo de base = 10293 y altura = 71.981 es de %f\n",
         area_rectangulo(10293, 71.981));
  printf("El área de un cuadrado de lado = 123896.1 es de %f\n",
         area_cuadrado(123896.1));
  printf("El área de un rombo de diagonal mayor = 9.9001 y diagonal menor = 0.001 es de %f\n",
         area_rombo(9.9001, 0.001));

  return EXIT_SUCCESS;
}

