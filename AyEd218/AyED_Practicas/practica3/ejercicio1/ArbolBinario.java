package practica3.ejercicio1;
import practica2.*;
import practica2.ejercicio1.ColaGenerica;

public class ArbolBinario<T> {

	private NodoBinario<T> raiz;

	public ArbolBinario(T dato) {
		this.raiz = new NodoBinario<T>(dato);
	}

	private ArbolBinario(NodoBinario<T> nodo) {
		this.raiz = nodo;
	}

	private NodoBinario<T> getRaiz() {
		return raiz;
	}

	public T getDatoRaiz() {
		if (this.getRaiz() != null) {
			return this.getRaiz().getDato();
		} else {
			return null;
		}
	}

	public ArbolBinario<T> getHijoIzquierdo() {
		return new ArbolBinario<T>(this.raiz.getHijoIzquierdo());
	}

	public ArbolBinario<T> getHijoDerecho() {
		return new ArbolBinario<T>(this.raiz.getHijoDerecho());
	}

	public void agregarHijoIzquierdo(ArbolBinario<T> hijo) {
		this.raiz.setHijoIzquierdo(hijo.getRaiz());
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo) {
		this.raiz.setHijoDerecho(hijo.getRaiz());
	}

	public void eliminarHijoIzquierdo() {
		this.raiz.setHijoIzquierdo(null);
	}

	public void eliminarHijoDerecho() {
		this.raiz.setHijoDerecho(null);
	}

	public boolean esVacio() {
		return this.getDatoRaiz() == null;
	}

	public boolean esHoja() {
		return this.getDatoRaiz() != null && this.getHijoIzquierdo().esVacio() && this.getHijoDerecho().esVacio();
	}
	
	public int contarHojas(ArbolBinario<T> arbol){
		
		if(arbol.esVacio()) {
			return 0;
		}
		if(arbol.esHoja()) {
			return 1;
		}
		else {
			return contarHojas(arbol.getHijoDerecho())+contarHojas(arbol.getHijoIzquierdo());
		}		
	}
	
	public void entreNiveles(int n, int m) {
		ArbolBinario<T> arbol = null;
		ColaGenerica<ArbolBinario<T>> cola = new ColaGenerica<ArbolBinario<T>>();

		cola.encolar(this);
		cola.encolar(null);
		
		int nivel = 1;
		while(!cola.esVacia()) {
			arbol = cola.desencolar();
			
			if (arbol != null) {
				
				if(nivel >= n & nivel <= m) {
					System.out.println(arbol.getDatoRaiz());
				}
								
				if(!arbol.getHijoIzquierdo().esVacio()) {
					cola.encolar(arbol.getHijoIzquierdo());
				}
				if(!arbol.getHijoDerecho().esVacio()) {
					cola.encolar(arbol.getHijoDerecho());
				}
			}else
				if(!cola.esVacia()) {
					System.out.println("nivel: "+nivel);
					nivel++;
					cola.encolar(null);
				}
		}
	
	}
	
	public ArbolBinario<T> espejo(){
		
		public ArbolBinario<T> espejo2(ArbolBinario<T> arbol){
			
			arbol.agregarHijoDerecho(espejo2(arbol.getHijoIzquierdo()));
			arbol.agregarHijoIzquierdo(espejo2(arbol.getHijoDerecho()));
			
		}
		
	}

}