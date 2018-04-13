program p2e1;
const
	valoralto = 9999;
type
	ventas = record
		cod: integer;
		nom: string[20];
		mon: real;
		end;

	Fventas = file of ventas;

procedure Leer(var archivo:Fventas; var reg:ventas);
begin
	if (not eof(archivo)) then
		read(archivo,reg)
	else
		reg.cod:= valoralto;
end;

VAR
	nuevo,archivo: Fventas;
	reg,regTo: ventas;
	CodAct: integer;

BEGIN
	assign(archivo,'ListaArchivo');
	assign(nuevo,'Compactado');
	reset(archivo);
	rewrite(nuevo);
	Leer(archivo,reg);
	while(reg.cod <> valoralto) do begin
		CodAct:=reg.cod;
		while (reg.cod = CodAct) do begin
            regTo.mon:= regTo.mon+reg.mon;
			Leer(archivo,reg);		
			end;
		write(nuevo,regTo);
		end;
	close(archivo);
	close(nuevo);
END.
