program p3e8;
uses sysutils;
type
	chunk = array[0..150] of byte;

procedure crearRegistro(var arrChunk: chunk);
var
	apellido, nombre: string;
	fechaNac: Longint;
	longApe, longNom, longReg: integer;
begin
	longReg:= 0;
	move(arrChunk,longReg,1);

	write('Ingrese Apellido: ');readln(apellido);
	move(apellido, longApe, 1);		// mueve a longApe la longitud del string
	move(apellido, arrChunk, longApe);

	write('Ingrese Nombre: ';readln(nombre);
	move(nombre, longNom, 1);		//NO ANDA, preguntar como hacer para copiar una variable al arreglo
	move(nombre, arrChunk, longNom);

	write('Ingrese fecha nacimiento: ');readln(fechaNac);
	move(nombre, arrChunk, 4);

	longReg:= longNom + longApe + 4;
	//ubicarse en la primera posicion y escribir la longitud del registro
end;

procedure eliminarLog(var archivo: file);
var
	busQ: string;
	buffer
begin
	
end;