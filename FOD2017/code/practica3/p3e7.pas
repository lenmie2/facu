program p3e7;
uses crt,sysutils;
const
	rutaDefault = 'D:\facu\fod2017\source\practica3\p3e7';
{Creo el archivo de longitud variable pasado por parametro. Se generaran registros hasta
que se ingrese un nombre en blanco}
procedure crearArchivo(var archivo: file);
var
	nombre: string[64];{es completamente necesario que este seteado la longitud}
begin
	assign(archivo,rutaDefault+'\archivoPersonas');
	rewrite(archivo, 1);
	Write('Ingrese nombre: ');readln(nombre);
	while (nombre <> '') do begin
		blockwrite(archivo,nombre,Length(nombre)+1); {lenght te mide el string, no el byte del principio. por eso el +1}
		Write('Ingrese nombre: ');readln(nombre);
	end;
	close(archivo);
	write('--------- archivo de nombres creado ---------');readln();
end;
{Abre el archivo de nombres y lo muestra en pantañña}
procedure listarArchivo(var archivo: file); 			
var
	buffer,longitud:char; {la longitud va a guardar el primer bit. buffer}
	i:integer;
	campo: string[64];
begin
	assign(archivo,rutaDefault+'\archivoPersonas');
	reset(archivo,1);
	{para mostrar cada registro individualmente utilizo el primer byte
	y con un for utilizo un buffer para cargar hasta que llegue a longitud dada
	.No se puede cargar directamente con la longitud porque pascal, ya lo intente
	por ahi si lo pones en un parcial no te dicen nada, pero no funciona como deberia
	en la practica}
	while (not eof(archivo)) do begin
		campo:= '';
		blockread(archivo, longitud, sizeof(longitud));
		for i:= 1 to (ord(longitud)) do begin 		
		    blockread(archivo, buffer, sizeof(longitud));
			campo:= campo + buffer;
		end;
		writeln(campo);readln();
	end;
	close(archivo);
	write('--------- archivo de nombres listado ---------');readln();			
end;

VAR
	archivo: file;
BEGIN

        crearArchivo(archivo);
	listarArchivo(archivo);
END.
