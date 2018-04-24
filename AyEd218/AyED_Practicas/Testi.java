import practica1.*;

public class Testi{
	
	public static void cambiarNombre(Alumno c, String nombre) {
		c.setNombre(nombre);			
	}
	
	public static void main(String[] args) {
		String nuevo = new String("Javier");
		Alumno c = new Alumno();
		c.setNombre("Bernardo");
		System.out.print(c.getNombre());
		Testi.cambiarNombre(c, nuevo);
		System.out.print(c.getNombre());	
	}
}