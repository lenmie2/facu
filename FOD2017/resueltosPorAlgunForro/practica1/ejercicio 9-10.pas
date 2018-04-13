program p1e9;
type
	producto = record
		cod: integer;
		nom: string[20];
		act: integer;
		min: integer;
		pre: real;
		end;

	Fproducto = file of producto

procedure Leer(var archivo:Fproducto;var reg:producto);
begin
	if (not eof(archivo)) then
		read(archivo,reg)
	else
		reg.cod:= 0;
end;

procedure CrearRegistro(var reg: producto);
begin
	write('Ingrese el : ');readln(reg.cod);
	if (reg.cod <> 0) then begin
		write('Ingrese el : ');readln(reg.nom);
		write('Ingrese el : ');readln(reg.act);
		write('Ingrese el : ');readln(reg.min);
		write('Ingrese el : ');readln(reg.pre);
		end;
end;

procedure CrearArchivo(var archivo: Fproducto);
var
	reg: producto
begin
	assign(archivo,'Archivo de Productos');
	rewrite(archivo);
	CrearRegistro(reg);
	while (reg.cod <> 0) do begin
		write(archivo,reg);
		CrearRegistro(reg);
	end;
	close(archivo)
end;

procedure Minimos(var archivo: Fproducto);
var
	reg: producto;
begin
	assign(archivo,'Archivo de Productos'),
	reset(archivo);
	Leer(archivo,reg);
	while (reg.cod <> 0) do begin
		if (reg.act < reg.min) then
			writeln(reg.cod);
		Leer(archivo,reg);
		end;
	close(archivo);
end;

procedure Actualizar(var archivo: Fproducto);
var
	reg: producto;	
begin
	assign(archivo,'Archivo de Productos'),
	reset(archivo);
	Leer(archivo,reg);
	while (reg.cod <> 0) do begin	
		if (reg.act < 10) then begin
			reg.pre:= reg.pre+(reg.pre*100/15);
			seek(archivo,filepos(archivo)-1);
			write(archivo,reg);
			end;
		end;
	close(archivo);
end;

VAR 
	ListaProductos: Fproducto;
	opcion: integer;
BEGIN
	CrearArchivo(ListaProductos);
	write('Ingrese opcion 1 para listar los productos en bajo stock u opcion 2 para actualizar los precios');
	readln(opcion);
	if (opcion = 1) then Minimos(ListaProductos)
	else if(opcion = 2) then Actualizar(ListaProductos);
END.
	
end;
