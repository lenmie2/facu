package practica2.ejercicio1;
import practica1B.ejercicio3.*;

public class TestListaEnlazadaGenerica {

	public static void main(String[] args) {
		
		ListaEnlazadaGenerica<Estudiante> lista = new ListaEnlazadaGenerica<Estudiante>();
		Estudiante[] arreglo = new Estudiante[4];
		
		lista.agregarInicio(new Estudiante("1","encinas","A","enci.javier@yahoo.com","que te importa"));
		lista.agregarInicio(new Estudiante("2","encinas","A","enci.javier@yahoo.com","que te importa"));
		lista.agregarInicio(new Estudiante("3","encinas","A","enci.javier@yahoo.com","que te importa"));
		lista.agregarInicio(new Estudiante("4","encinas","A","enci.javier@yahoo.com","que te importa"));
		
		lista.comenzar();
		/*
		while(!lista.fin()){
			System.out.println(lista.proximo().tusDatos());	
		}
		*/
		Boolean algo = lista.agregar(arreglo);
		System.out.println(arreglo[3].tusDatos()+" "+algo.toString());
		
		
	}
	
	
}
