program ParcialPrimeraFecha;
type
	producto = record
		cod: Integer;
		nom: String[20];
		des: String[40];
		bar: Longint;
		cat: char;
		sact: integer;
		smin: integer;
		end;
	pedido = record
		cod: Integer;
		des: String[40];
		cant: integer;
		end;

	Fproducto = file of producto;	
	Fpedido = file of pedido;

var
	regMA: producto;
	min,regD1,regD2,regD3: pedido;
	mae1: Fproducto;
	det1,det2,det3: Fpedido;
	aux,total: integer;


procedure Leer(var archivo:producto; var reg:pedido);
begin
	if (not eof(archivo)) then
		read(archivo,reg)
	else
		reg.cod:= valoralto;
end;	

procedure Minimo(var regD1,regD2,regD3,min: producto);
begin
	if (regD1.cod <= regD2.cod) and (regD1.cod <= regD3.cod) then 
		min:= regD1;
		Leer(det1,regD1);
	else if (regD2 <= regD3) then
		min:=regD2;
		Leer(det2,regD2);
	else 
		min:= regD3;
		Leer(det3,regD3);
	end;
end;

begin
	assign(mae1,'maestro');
	assign(det1,'detalle1');
	assign(det2,'detalle2');
	assign(det3,'detalle3');
	reset(mae1);
	reset(det1);
	reset(det2);
	reset(det3);
	read(mae1,regMA);
	Leer(det1,regD1);
	Leer(det2,regD2);
	Leer(det3,regD3);
	minimo(regD1,regD2,regD3,min);
	while (min.cod <> valoralto) do begin
		aux:=min.cod;
		total:= 0;
		while (aux = min.cod) do begin
			total:= total + min.cant;
			minimo(regD1,regD2,regD3,min);
			end;
		while (regMA.cod <> min.cod) do begin
			read(mae1,regMA);
		regMA.sact:= regMA.sact - total;
		if (regMA.sact < regMA.smin) then begin
			writeln('El stock esta por debajo del minimo');
			if (regMA.sact < 0);
			writeln('No se pudo satisfacer el pedido, falto ',regMA.sact*-1,' productos');
			end;
		seek(mae1,filepos(mae1)-1);
		write(mae1,regMA);
		if (not eof (mae1)) then
			read(mae1,regMA);
		end;
	close(regMA);
	close(regD1);
	close(regD2);
	close(regD3);
end.
