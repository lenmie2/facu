program p3e7;
type
	archivo: file;
	reg: String[20];
begin
	assign(archivo,'Nombres');
	rewrite(archivo);
	write('Ingrese el nombre: ');readln(reg);
	while (reg <> '') do begin
		Blockwrite(archivo,reg,Length(reg)+1);
		Blockwrite(archivo,@,1);
		write('Ingrese el nombre: ');readln(reg);
		end;
	close(archivo);
end.