package practica1B.ejercicio3;

public class Test{
	
	public static void main(String[] args) {
		
		Estudiante[] arregloEstudiante = new Estudiante[2];
		Profesor[] arregloProfesor = new Profesor[3];
		
		arregloEstudiante[0] = new Estudiante("1","encinas","A","enci.javier@yahoo.com","que te importa");
		arregloEstudiante[1] = new Estudiante("2","encinas","A","enci.javier@yahoo.com","que te importa");
		
		arregloProfesor[0] = new Profesor("1","encinas","A","enci.javier@yahoo.com","que te importa");
		arregloProfesor[1] = new Profesor("2","encinas","A","enci.javier@yahoo.com","que te importa");
		arregloProfesor[2] = new Profesor("3","encinas","A","enci.javier@yahoo.com","que te importa");
		
		System.out.println(arregloEstudiante[0].tusDatos());
		System.out.println(arregloEstudiante[1].tusDatos());
		System.out.println(arregloProfesor[0].tusDatos());
		System.out.println(arregloProfesor[1].tusDatos());
		System.out.println(arregloProfesor[2].tusDatos());
				
	}
	
	
}