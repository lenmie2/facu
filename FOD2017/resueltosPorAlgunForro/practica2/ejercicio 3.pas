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

var 
	maestro: inventario;
	det1,det2,det3: resto_pedido;
	regMA: producto;
	regDET1,regDET2,regDET3: pedido;

procedure Leer(var archivo:producto; var reg:pedido);
begin
	if (not eof(archivo)) then
		read(archivo,reg)
	else
		reg.cod:= valoralto;
end;

procedure minimo (var r1,r2,r3,min: resto_pedido);
begin
	if (r1.cod <=r2.cod) and (r1.cod <= r3.cod) then begin
		min:= r1;
		Leer(det1,r1);		
		end;
	else
		if (r2.cod <= r3.cod) then begin
			min:=  r2;
			leer(det2,r2);
		end;
	else
		begin
			min:= r3;
			Leer(det1,r1);
		end;
end;
var 
	aux,total: integer;
begin
	assign(maestro,'ProductosLista');
	assign(det1,'Pedido1');
	assign(det2,'Pedido2');
	assign(det3,'Pedido3');
	reset(maestro);
	reset(det1);
	reset(det2);
	reset(det3);
	read(maestro,regMA);
	Leer(det1,regDET1);
	Leer(det2,regDET2);
	Leer(det3,regDET3);
	minimo(regDET1,regDET2,regDET3,min);
	while (min.cod <> valoralto) do begin
		aux:= min.cod;
		total:= 0;
		while (aux = min.cod) do begin
			total:= total + min.ped;
			minimo(regDET1,regDET2,regDET3,min);
			end;	
		while (regMA <> min.cod) do begin
			read(maestro,regMA);
		regMA:= regMA.cant - total;
		seek(maestro,filepos(maestro)-1);
		write(maestro,regMA);
		if (not eof maestro) then
			read(maestro,regMA);
		end;		
	end;
	close(det1);
	close(det2);
	close(det3);
	close(maestro);
end.


end;
