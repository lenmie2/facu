program p1e2-3;
type
	numeros = file of integer;
VAR
	par,imp,num_reg: integer;
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
	reset(num_log);
	read(num_log,num_reg);
	while (not eof(num_log)) do begin
		if (((num_reg) mod 2)=0) then begin
			writeln(num_reg);
			par:= par+1;
		else
			imp:= imp+1;
		read(num_log,num_reg);
		end;
	writeln('cant de numeros par: ',par);
	writeln('cant de numeros imp: ',imp);	
	close(num_log);
END.