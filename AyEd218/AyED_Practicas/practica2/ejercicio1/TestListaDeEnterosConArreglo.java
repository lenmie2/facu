package practica2.ejercicio1;

public class TestListaDeEnterosConArreglo {

	public static void main(String[] args) {
		
		ListaDeEnterosConArreglos lista = new ListaDeEnterosConArreglos();
		
		for (int i = 0;i< args.length;i++) {
			lista.agregarInicio(Integer.parseInt(args[i]));
		}
		
		/*
		lista.comenzar();
		while(!lista.esVacia()) {
			System.out.println(lista.proximo());
			
		}
		(no puede ejecutar comenzar() dos veces)??
		*/
		System.out.println("Ahora en Orden");
		lista.comenzar();
		imprimirRecursivo(lista);
	}
	
	public static void imprimirRecursivo(ListaDeEnterosConArreglos lista) {
		
		Integer elem = lista.proximo();
		if(!lista.fin()) {
			imprimirRecursivo(lista);
		}
		System.out.println(elem);
		
	}

}
