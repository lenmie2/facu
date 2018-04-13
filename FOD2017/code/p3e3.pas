program p3e3;
uses sysutils;
const
	valorAlto = 999;
type
	tipoDocente = record
		cod	: Integer;
		nom : String;
		ape : string;
		edad: integer;		
	end;

	tipoArchDocente = file of tipoDocente;

procedure ImportarDesdeTexto(var archivo: tipoArchDocente);
var
	registro: tipoDocente;
	textoMaestro: text;
begin
	assign(textoMaestro,'D:\facu\fod2017\scr\p3e3TextoMaestro.txt');
	reset(textoMaestro);
	rewrite(archivo);
	while (not eof(textoMaestro)) do begin
		readln(textoMaestro,registro.cod,registro.edad);
		readln(textoMaestro,registro.ape);
		readln(textoMaestro,registro.nom);
		write(archivo,registro);
	end;
	close(textoMaestro);
	writeln('/// Importado exitoso ///');readln();
end;
////
////
////
procedure Filtrar(var archivo: tipoArchDocente);
var
	registro: tipoDocente;
begin
	seek(archivo,0);
	read(archivo, registro);
	while (not eof(archivo)) do begin
		if (registro.edad >= 65) then begin
			registro.cod:= valorAlto;
			seek(archivo,filepos(archivo)-1);
			write(archivo,registro);			
		end;
		read(archivo,registro);
	end;	
	writeln('/// Filtrado exitoso ///');readln();
end;
////
////
////
procedure ExportarATexto(var archivo: tipoArchDocente);
var
	registro: tipoDocente;
	textoReporte: text;
begin
	assign(textoReporte, 'D:\facu\fod2017\scr\p3e3TextoReporte.txt');
	rewrite(textoReporte);
	seek(archivo,0);
	writeln(textoReporte,'-------------------------------');
	writeln(textoReporte,'----- Listado de Docentes -----');
	writeln(textoReporte,'-------------------------------');
	read(archivo,registro);
	while (not eof(archivo)) do begin
		if (registro.cod <> valorAlto) then begin
			writeln(textoReporte,'-------------------------------');
			writeln(textoReporte,'Docente Codigo: ',registro.cod);
			writeln(textoReporte,'		apellido:',registro.ape);
			writeln(textoReporte,'		nombre:',registro.nom);
			writeln(textoReporte,'		edad:',registro.edad);
		end;
		read(archivo,registro);
	end;
	writeln(textoReporte,'-------------------------------');
	writeln(textoReporte,'------------- Fin -------------');
	writeln('/// Texto Reporte Creado ///');readln();
	close(textoReporte);
end;
////
////
////
VAR
	archivo: tipoArchDocente;
BEGIN
	assign(archivo,'D:\facu\fod2017\scr\p3e3DatosMaestro.dat');
	ImportarDesdeTexto(archivo);
	Filtrar(archivo);
	ExportarATexto(archivo);
	close(archivo);
	writeln('/// Programa finalizado ///');readln();
END.
