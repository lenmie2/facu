program p1e4;
const
	valoralto='9999'
type
	real_log = file of real;
procedure Leer(var archivo: real_log; var reg: real);
begin
	if (not eof(archivo)) then
		read(archivo,reg)
	else
		dato.cod:= valoralto;
end;
procedure CrearArchivo(var archivo: real_log);
var
	reg: real;
	i,cant: integer;
begin
	assign(archivo,'Archivo de Letras');
	rewrite(archivo);
	write('Ingrese la cantidad de numeros que quiera entrar: ');readln(cant);
	for (i:=1 to cant) do begin
		write('ingrese numero: ');readln(reg);
		write(archivo,reg);
		end;
	close(archivo);
end;
procedure Listar10(var archivo: real_log);
var
	reg: real;
	cant: integer;
begin
	assign(archivo,'Archivo de Letras');
	reset(archivo);
	leer(archivo,reg)
	writeln('Se listaran los numeros de a 10')
	while (reg <> valoralto) do begin
		cant:=1;
		while(cant<=10) and (reg <> valoralto) do begin
			writeln(reg);
			cant:=cant+1;
			leer(archivo,reg);
			end;
		end;
	close (archivo);
end;		
procedure ListarNeg(var archivo: real_log)
var
	reg:real;
begin
	assign(archivo,'Archivo de Letras')
	reset(archivo);
	leer(archivo,reg);
	writeln('se listaran todos los numeros negativos');
	while(reg <> valoralto) do begin
		if ((reg mod 2)<>0) then
			write(reg);
		leer(archivo,reg);
		end;
	close(archivo);
end;

VAR
	archivo:real_log;
	opcion:integer;
BEGIN
	write('Escoja una opcion: A para crear archivo, B para listarlo de a 10, C para listar los negativos');
	readln(opcion);
	case opcion of
		'A':CrearArchivo(archivo);
		'B':Listar10(archivo);
		'C':ListarNeg(archivo);
		end;
END;
