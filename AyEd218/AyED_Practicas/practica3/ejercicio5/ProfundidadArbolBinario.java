package practica3.ejercicio5;

import practica2.ejercicio1.ColaGenerica;
import practica3.ejercicio1.ArbolBinario;

public class ProfundidadArbolBinario {

	private ArbolBinario<Integer> arbol;
	private ColaGenerica<ArbolBinario<Integer>> cola;
	
	
	public ArbolBinario<Integer> getArbol() {
		return arbol;
	}


	public void setArbol(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}


	public ColaGenerica<ArbolBinario<Integer>> getCola() {
		return cola;
	}


	public void setCola(ColaGenerica<ArbolBinario<Integer>> cola) {
		this.cola = cola;
	}


	public int sumaElementosProfundidad(int p) {
		
		this.getCola().encolar(this.getArbol());
		this.getCola().desencolar();
		
		
	}
	
}
