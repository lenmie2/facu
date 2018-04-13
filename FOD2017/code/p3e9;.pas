program p3e9;
const
	direccion = 'COMPLETAR';

procedure crearArchivo(var archivo: file);
var
	nombre, descripcion: string;
	stock: integer;
begin
	assign(archivo, direccion);
	rewrite(archivo);

	write('Ingrese nombre: ');readln(nombre);
	while (nombre <> '') do begin
		writeblock(archivo, nombre, Length(nombre)+1);
		writeblock(archivo, '#', 1);

		write('Ingrese descripcion: ');readln(descripcion);		
		writeblock(archivo, descripcion, Length(descripcion)+1);
		writeblock(archivo, '#', 1);

		write('Ingrese stock: ');readln(stock);
		writeblock(archivo, stock, sizeOf(stock));
		writeblock(archivo, '@', 1);
	
		write('Ingrese nombre: ');readln(nombre);
	end;
	write('--------- archivo de medicamentos creado ---------');readln();
	close(archivo);
end;

procedure listarContenido(var archivo: file);//PROBLEMA: COMO HAGO PARA PODER LEER ENTEROS CON ESTE ALGORITMO
var
	campo: string;
	buffer: char;
begin
	assign(archivo, direccion);
	reset(archivo);
	seek(archivo, 1);

	while (not eof (archivo)) do begin
		blockread(archivo, buffer, 1)
		while (buffer <> '@') and (not eof (archivo)) do begin
			campo:= '';
			while (buffer <> '@') and (buffer <> '@') and (not eof (archivo)) do begin
				campo:= campo + buffer;
				blockread(archivo, buffer, 1);			
			end;
			
		end;
		
	end;
	
end;