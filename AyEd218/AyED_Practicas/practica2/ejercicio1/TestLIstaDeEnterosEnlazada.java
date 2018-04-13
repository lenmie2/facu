package practica2.ejercicio1;

public class TestLIstaDeEnterosEnlazada {

	public static void main(String[] args) {
		
		ListaDeEnterosConArreglos lista = new ListaDeEnterosConArreglos();
		
		for (int i = 0;i< args.length;i++) {
			lista.agregarInicio(Integer.parseInt(args[i]));
		}
		int i=1;
		while(i <= lista.tamanio()) {
			System.out.println(lista.elemento(i));
			i++;
		
		}
	}

}
