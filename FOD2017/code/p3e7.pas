program p3e7;
uses crt;
const
	direccion = 'D:\facu\fod2017\scr\p3e7Archivo';
procedure crearArchivo(var archivo:	file);
var
	nombre: string[64];
begin
	assignfile(archivo,direccion);
	rewrite(archivo, 1);
	Write('Ingrese nombre: ');readln(nombre);
	while (nombre <> '') do begin
		blockwrite(archivo,nombre,Length(nombre)+1);
		blockwrite(archivo,'@',1);
		Write('Ingrese nombre: ');readln(nombre);		
	end;
	closefile(archivo);
	write('--------- archivo de nombres creado ---------');readln();
end;

procedure listarArchivo(var archivo: file); 			//PROBLEMA: COMO HAGO PARA PODER LEER ENTEROS CON ESTE ALGORITMO
var
	buffer: char;
	campo: string;
begin
	assignfile(archivo,direccion);
	reset(archivo,1);
	seek(archivo,1);
	while (not eof(archivo)) do begin
		campo:= '';
		blockread(archivo, buffer, 1);
		while (buffer <> '@') and (not eof(archivo)) do begin
			campo:= campo + buffer;
			blockread(archivo, buffer, 1);
		end;
		writeln(campo);
		if (not eof(archivo)) then
			blockread(archivo, buffer, 1);
	end;
	closefile(archivo);	
	write('--------- archivo de nombres listado ---------');readln();			
end;

VAR
	archivo: file;
BEGIN
	crearArchivo(archivo);
	listarArchivo(archivo);
END.
