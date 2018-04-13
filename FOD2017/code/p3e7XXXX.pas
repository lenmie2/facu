program p3e7;
uses crt;
procedure crearArchivo(var archivo:	file);
var
	nombre: String;
    charbuff: char;
begin
	assignfile(archivo,'D:\facu\fod2017\scr\p3e7Archivo');
	rewrite(archivo, 1);
        charbuff:= '@';
	Write('Ingrese nombre: ');readln(nombre);
	while (nombre <> '') do begin
		blockwrite(archivo,nombre,Length(nombre)+1);
		blockwrite(archivo,charbuff,1);
		Write('Ingrese nombre: ');readln(nombre);		
	end;
	closefile(archivo);
	write('--------- archivo de nombres creado ---------');readln();
end;

procedure listarArchivo(var archivo: file);
var
	data: array[0..99] of byte;
	i: integer;
begin
	assignfile(archivo,'D:\facu\fod2017\scr\p3e7Archivo');
	reset(archivo,1);
	write('-entra while');readln();
	while (not eof(archivo)) do begin
		blockread(archivo, data, sizeOf(data));
		for i:= 0 to 99 do begin
			write(data[i])
		end;
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
