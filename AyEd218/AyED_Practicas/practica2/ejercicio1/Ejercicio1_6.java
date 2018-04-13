package practica2.ejercicio1;

public class Ejercicio1_6 {

	public static void main(String[] args) {
		
		ListaDeEnterosEnlazada lista = new ListaDeEnterosEnlazada();
		lista.comenzar();
		lista = calcularSucesion(6);
		lista.comenzar();
		imprimir(lista);

	}

	public static ListaDeEnterosEnlazada calcularSucesion(int n) {
		
		ListaDeEnterosEnlazada lista;
		if(!(n==1)) {
			if(n%2==0) {
				int temp = n/2;
				lista = calcularSucesion(temp);
				lista.agregarFinal(temp);
				return lista;
			}
			else {
				int temp = n*3+1;
				lista = calcularSucesion(temp);
				lista.agregarFinal(temp);
				return lista;
			}
		}	
		else {

		lista = new ListaDeEnterosEnlazada();
		return lista;
		}
	}
	
	public static void imprimir(ListaDeEnterosEnlazada lista) {
		
		if (!lista.fin()){
			System.out.println(lista.proximo());
			imprimir(lista);
		}
	
	}
}
		
