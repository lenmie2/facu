Una empresa posse un archivo con informacionde las ventas realizadas por promotores, de cada uno de ellos se conoce:
codigo de promotor, nombre, y monto de venta. Este archivo se encuentra ordenado por codigo de promotor. Sabiendo
que en ese archivo pueden existir uno o mas registros por cada promotror, realice un procedimiento que reciba el 
archivo anteriormente descripto y lo compacte, esto es, generar un nuevo archivo donde cad apromotor aparezca 
una vez con sus ventas totales


program p2e1FER;
type
	promotor = record
		cod: Integer;
		nombre: string;
		monto: integer;
		end;
		
	arch: file of promotor;

var
	orig,compc: arch;
	us: string;

begin
	read(us);
	assign(orig,us);
	read(us);
	assign(compc,us);
	compatar(orig,compc);
end.

procedure compactar(var orig: arch;var compc: arch);
var
	p,h: promotor;
	mon :real;
	m: integer;
begin
	reset(orig);
	rewrite(comp);
	while (not eof(orig)) do begin
		read(orig,p); mon:=0;
		m:= h.cod;
		while (not eof(orig)) and (p.cod = m) do begin
			mon:= mon + p.monto;
			h:=p;
			read(orig,p);
			end;
		p.mon:= mon;
		write(compc,h);
		end;
	close(orig);
	close(compc);
end;