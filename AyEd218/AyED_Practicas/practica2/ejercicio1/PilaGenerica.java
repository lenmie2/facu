package practica2.ejercicio1;

public class PilaGenerica<T>{
	
	private ListaGenerica<T> datos;
	
	public void apilar(T elem) {
		datos.agregarInicio(elem);
	}
	
	public T desapilar(){
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
