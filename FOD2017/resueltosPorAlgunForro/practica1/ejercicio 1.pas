program p1e1;
type
	numeros = file of integer;
VAR
	num_reg: integer;
	num_log: numeros;
BEGIN
	assign(num_log,'archivo de numeros');
	rewrite(num_log);
	writeln('ingrese numero ');readln(num_reg);
	while (num_reg <> 0) do begin
		write(num_log,num_reg);
		writeln('ingrese numero ');readln(num_reg);
		end;
	close(num_log);
END.
