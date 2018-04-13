package practica1B.ejercicio2;

public class Ejercicio2{
	
	public static int[] nVeces(int n){
		
		int[] arreglo = new int[n];
		for(int i=0;i<n;i++) {
			arreglo[i]= n*(i+1);
		}
		
		return arreglo;
	}
	
	public static void main(String[] args) {
		
		int[] arreglo = Ejercicio2.nVeces(5);
		for(int i=0;i<5;i++) {
			System.out.println(arreglo[i]);
			
		}	
	}	
}