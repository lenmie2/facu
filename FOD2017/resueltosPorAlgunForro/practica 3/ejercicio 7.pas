program p3e7;
type
	archivo: file;
	campo,buffer: String[20];
begin
	assign(archivo,'Nombres');
	rewrite(archivo);
	write('Ingrese el nombre: ');readln(campo);
	while (campo <> '') do begin
		Blockwrite(archivo,campo,Length(campo)+1);
		Blockwrite(archivo,'#',1);
		Blockwrite(archivo,'@',1);
		write('Ingrese el nombre: ');readln(campo);
		end;
	close(archivo);
	//
	reset(archivo);
	while (not eof(archivo)) do begin
		Blockread(archivo,buffer,1);
		while (buffer <> '@') and (not eof(archivo)) do begin
			while (buffer <> '#') and (buffer <> '@') and (not eof(archivo)) do begin
				campo:= campo + buffer;
				Blockread(archivo,buffer,1);
				end;
			write(campo);
			end;
		if (not eof (archivo)) then
			Blockread(archivo,nombre,1);
		end;
	close(archivo);

end.