package practica3.ejercicio4;
import practica3.*;
import practica3.ejercicio1.ArbolBinario;
import practica2.*;
import practica2.ejercicio1.ColaGenerica;
import practica2.ejercicio1.ListaEnlazadaGenerica;

public class RedBinariaLlena {
	
	private ArbolBinario<Integer> arbol;
	
	public ArbolBinario<Integer> getArbol(){
		return this.arbol;
	}
	
	public void setArbol(ArbolBinario<Integer> a) {
		this.arbol = a;
	}
	
	public void cargarArbol() {
			
		this.arbol = new ArbolBinario<Integer>(50);
		ArbolBinario<Integer> a2 = new ArbolBinario<Integer>(25);
		ArbolBinario<Integer> a3 = new ArbolBinario<Integer>(75);
		ArbolBinario<Integer> a4 = new ArbolBinario<Integer>(35);
		ArbolBinario<Integer> a5 = new ArbolBinario<Integer>(85);
		ArbolBinario<Integer> a6 = new ArbolBinario<Integer>(15);
		ArbolBinario<Integer> a7 = new ArbolBinario<Integer>(65);
		
		this.arbol.agregarHijoIzquierdo(a2);
		this.arbol.agregarHijoDerecho(a3);
		
		this.arbol.getHijoDerecho().agregarHijoDerecho(a4);
		this.arbol.getHijoDerecho().agregarHijoIzquierdo(a7);
		
		this.arbol.getHijoIzquierdo().agregarHijoIzquierdo(a6);
		this.arbol.getHijoIzquierdo().agregarHijoDerecho(a5);
	}
	
	
	
	private int retardoEnvio(ArbolBinario<Integer> arbol) {
		
		if(arbol.esHoja()) {
			return arbol.getDatoRaiz();
		}
		else {
			return arbol.getDatoRaiz()+Math.max(this.retardoEnvio(arbol.getHijoIzquierdo()),this.retardoEnvio(arbol.getHijoDerecho()));
		}
	
	}
	
	public int retardoEnvio() {
				
		return retardoEnvio(arbol);
		
	}
	
	
	public static void main(String[] args) {
		
		RedBinariaLlena red = new RedBinariaLlena();
		red.cargarArbol();
		System.out.println(red.getArbol());

	}

}
