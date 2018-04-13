program p3e1;
type
	producto = record
		num: Integer;
		nom: string[20];
		cmin: integer;
		cmax: integer;
		cact: integer;
		prec: real;
		end;

	Fproducto = file of producto;

procedure CrearArchivo(var archivo: Fproducto);
var
	reg: producto;
begin
	assign(archivo,'MaestroDeProductos');
	rewrite(archivo);
	reg.num:=0;write(archivo,reg);
	CrearReg(reg);                        //proceso para ingresar todos los campos de reg hasta que su .num sea 0
	while (reg.num <> 0) do begin
		write(archivo,reg);
		CrearReg(reg);
	end;
	close(archivo);
end;

procedure Alta(var archivo: Fproducto);
var
	aux,reg: producto;
	busq: integer;

begin
	CrearReg(reg);
	reset(archivo);
	read(archivo,aux);
	busq:= aux.num;
	read(archivo,aux);
	while (aux.num <> busq) and (not eof(archivo)) do begin
		read(archivo,aux);
	end;
	seek(archivo,filepos(archivo)-1);
	write(archivo,reg);
	if (aux.num < 0) then begin
		reset(archivo);
		write(archivo,aux);
		end;	
end;

procedure Modif(var archivo: Fproducto);
var
	reg: producto;
	busq: integer;
begin
	reset(archivo);
	write('Ingrese numero del producto a modificar: ');readln(busq);
	read(archivo,reg);
	read(archivo,reg)
	while(reg.num <> busq) and (not eof(archivo)) do
		read(archivo,reg);
	CrearRegModif(reg);					//proceso que crea el registro sin modificar el numero
	seek(archivo,filepos(archivo)-1);
	write(archivo,reg);
end;

procedure Baja(var archivo: Fproducto);
var
	aux,reg: producto;
	busq: integer;
begin
	reset(archivo);
	write('Ingrese el numero del producto que desea borrar: ');readln(busq);
	read(archivo,aux);
	seek(archivo,filepos(archivo)-1);
	reg.num:=busq;
	write(archivo,reg);
	while (reg.num <> busq) and (not eof(archivo)) do
		read(archivo,reg);
	seek(archivo,filepos(archivo)-1);
	write(archivo,aux);
end;

procedure AbrirArchivo(var archivo: Fproducto);
var
	reg: producto;
	opcion: integer;
begin
	assign(archivo,'MaestroDeProductos');
	write('Ingrese Opcion: ');readln(opcion);
	case opcion of
		1: Alta(archivo);
		2: Modif(archivo);
		3: Baja(archivo);
		end;
	close(AbrirArchivo);
end;
var
	archivo: Fproducto;
begin
	CrearArchivo(archivo);
	AbrirArchivo(archivo);
end.
