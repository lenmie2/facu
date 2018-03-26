 package practica1B.ejercicio1;
 
 public class Ejercicio1{
	 
	 public static void imprimirFor(int a, int b) {
		 for(int i=a; i<=b; i++) {
			 System.out.println(i);
		 }
	 }
	 
	 public static void imprimirWhile(int a, int b) {
		 int i = 1;
		 while(i <= b) {
			 System.out.println(i);
			 i= i+1;
		 }		 
	 }
	 
	 public static void imprimirRecursivo(int a, int b) {
		 if(a > b) {
			 return;
		 }
		 else {
			 System.out.println(a);
			 a= a+1;
			 Ejercicio1.imprimirRecursivo(a,b);
		 }
		 
	 }
 
	 public static class Test{
		 
		 public static void main(String[] args) {
			 
			 int n1 = Integer.parseInt(args[0]);
			 int n2 = Integer.parseInt(args[1]);
			 Ejercicio1.imprimirRecursivo(n1, n2);
		 } 
		 
	 }
 }