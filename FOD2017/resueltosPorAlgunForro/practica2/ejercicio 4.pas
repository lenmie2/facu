	program p2e3;
type		
	producto= record
		cod: integer;
		des: string[15];
		sact:integer;
		smin:integer;
		end;
	pedido= record
		cod: integer;
		ped: integer;
		end;

	inventario= file of producto;
	resto_pedido= file of pedido;

procedure OpcionA(var archivo:inventario);
var
	str: string;
	rMa: producto;
	texto: txt;
begin
	assign(texto,'texto de maestro');
	assign(archivo,'ArchivoMaestro');
	reset(texto);
	reset(archivo);
	readln(str);
	while (not eof(texto)) do begin

		
	end;
end;

procedure OpcionB(var );
begin
	
end;