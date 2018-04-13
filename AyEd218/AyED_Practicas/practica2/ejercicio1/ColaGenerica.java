package practica2.ejercicio1;

public class ColaGenerica<T> {

	private ListaGenerica<T> datos = new ListaEnlazadaGenerica<T>();
	
	public void encolar(T elem) {
		datos.agregarFinal(elem);
	}
	
	public T desencolar(){
		T elem = datos.elemento(1);
		datos.eliminarEn(1);
		return elem;	
		
	}
	
	public T tope() {
		return datos.elemento(1);
	}
	
	public Boolean esVacia() {
		return datos.esVacia();
	}
	
	
}
