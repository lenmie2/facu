package practica3.ejercicio3;
import practica3.ejercicio1.*;
import practica2.*;
import practica2.ejercicio1.ListaEnlazadaGenerica;

public class ContadorArbol {

	private ArbolBinario<Integer> arbol;
	
	public ArbolBinario<Integer> getArbol(){
		
		return this.arbol;
	}
	
	public void setArbol(ArbolBinario<Integer> arbo) {
		this.arbol = arbo;
	}
	
	public static Integer numerosPares(ArbolBinario<Integer> arbol){
		
		if((arbol.getDatoRaiz() % 2) == 0){
			Integer n = arbol.getDatoRaiz();
		}
		
		if(!arbol.getHijoDerecho().esVacio()){
			ContadorArbol.numerosPares(arbol.getHijoDerecho());
			
		}
		if(!arbol.getHijoIzquierdo().esVacio()) {
			ContadorArbol.numerosPares(arbol.getHijoIzquierdo());
		}
		
		return n;	 
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

}
