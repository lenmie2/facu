package practica1B.ejercicio3;

public class Estudiante {
	
	private String nombre;
	private String apellido;
	private String comicion;
	private String email;
	private String direccion;
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getComicion() {
		return comicion;
	}
	public void setComicion(String comicion) {
		this.comicion = comicion;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Estudiante(String nombre, String apellido, String comicion, String email, String direccion) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.comicion = comicion;
		this.email = email;
		this.direccion = direccion;
	}
	
	public String tusDatos() {
		return this.getNombre()+this.getApellido()+this.getComicion()+this.getDireccion();
		
	}
	
}
