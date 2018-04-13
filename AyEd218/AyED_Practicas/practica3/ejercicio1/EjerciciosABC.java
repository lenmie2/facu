package practica3.ejercicio1;

public class EjerciciosABC {

	
	public static void main(String[] args) {
		
		
		ArbolBinario<Integer> arbol1 = new ArbolBinario<Integer>(5);
		ArbolBinario<Integer> arbol2 = new ArbolBinario<Integer>(2);
		ArbolBinario<Integer> arbol3 = new ArbolBinario<Integer>(7);
		ArbolBinario<Integer> arbol4 = new ArbolBinario<Integer>(9);
		
		
		arbol1.agregarHijoDerecho(arbol2);
		arbol1.agregarHijoIzquierdo(arbol3);
		arbol1.getHijoIzquierdo().agregarHijoIzquierdo(arbol4);
		
		
		Integer n = 0;
		System.out.println("cantidad de hojas es: "+arbol1.contarHojas(arbol1));
		arbol1.entreNiveles(1,2);
		
	}
}
