program	p3e4y5;
uses sysutils;
type
	tNombre = string;
	tArchivoPersonas = file of tNombre;
	intSet = set of 0..9;
///
///
///
procedure agregar(var archivo: tArchivoPersonas;var nombre: tNombre);
var
	auxNombre: tNombre;
	posDel: integer;
begin
	seek(archivo, 0);
	read(archivo, auxNombre);
	posDel:= StrToInt(auxNombre);			//Obtengo auxNombre y me muevo de acuerdo su valor numerico
	if (posDel <> 0) then begin
		seek(archivo, posDel);			//me muevo al registro a reemplazar y lo leo
		read(archivo, auxNombre);		

		seek(archivo,filepos(archivo)-1);	//sobreescribo con nuevos datos
		write(archivo, nombre);

		seek(archivo,0);
		write(archivo,auxNombre)			//me muevo al header y excribo el siguiente topepila		
	end
	else begin
		seek(archivo,filesize(archivo));
		write(archivo,nombre);
	end;
	write('---nombre correctamente agregado---');readln();
end;
///
///
///
procedure eliminar(var archivo: tArchivoPersonas;var nombre: tNombre);
var
	header,auxNombre: tNombre;
	posDel: integer;
begin
	seek(archivo,0);			//Obtengo el siguiente puntero a eliminar
	read(archivo, header);	
	read(archivo, auxNombre);
	while((not eof(archivo)) and (auxNombre <> nombre))do
		read(archivo,auxNombre);			//Obtengo el registro a a eliminar y lo uso como siguiente puntero
	auxNombre:= IntToStr(filepos(archivo));

	seek(archivo, filepos(archivo)-1);	//Sobreescribo con el ultimo tope pila
	write(archivo, header);

	seek(archivo, 0);
	write(archivo, auxNombre);

	write('---registro  ',posDel,' eliminado---');readln();
end;
///
///
///
procedure listar(var archivo: tArchivoPersonas);
var
	auxNombre: tNombre;
begin
write('---nasdsad-');readln();
	reset(archivo);
 write('---nasdsad-');readln();
	read(archivo,auxNombre);
 write('---nasdsad-');readln();
	writeln('-------------------------------');
	writeln('----- Listado de Personas -----');
	writeln('-------------------------------');readln();
	while (not eof(archivo)) do begin
		if (StrToInt(auxNombre) in intSet) then
			read(archivo,auxNombre);
		writeln('	-',auxNombre);
		read(archivo,auxNombre);		
	end;	
	writeln('-------------------------------');
	writeln('--------listado completo-------');readln();
end;
///
///
///
procedure importarDesdeTexto(var archivo: tArchivoPersonas);
var
	textoMaestro: text;
	auxNombre: tNombre;
begin
	assign(textoMaestro, 'D:\facu\fod2017\scr\p3e4TextoMaestro.txt');
	reset(textoMaestro);
	rewrite(archivo);
	readln(textoMaestro, auxNombre);
	while (not eof(archivo)) do begin
		writeln(auxNombre);
		write(archivo,auxNombre);
		readln(textoMaestro,auxNombre);		
	end;
	close(textoMaestro);	
 	writeln('-------------------------------');
	writeln('--------importado exitoso-------');readln();
end;
///
///
///
VAR
	archivo: tArchivoPersonas;
BEGIN
	assign(archivo,'D:\facu\fod2017\scr\archivoPersonas.dat');
	importarDesdeTexto(archivo);
	listar(archivo);
	close(archivo);
 readln();
 readln();
END.
