program p1e6;
type
	persona = record
		ape: string[15];
		nom: string[15];
		nac: longint;
		end;
	arch_persona = file of persona;
	
procedure crearpersona(var p:persona);
begin
	writeln ('//nuevo ingreso//');
	write('ingrese el apellido');readln(p.ape);
	if (p.ape <> '') then begin
		write('ingrese el nombre');readln(p.nom);
		write('ingrese la fecha de nacimiento (en formato aaaammdd)');readln(p.nac);
		end;
end;

procedure opcion1(var log_persona:arch_persona);
var
	fis_persona:string[15];
	aux:persona;
begin
	write('ingrese el nombre del archivo a crear:');readln(fis_persona);
	assign(log_persona,fis_persona);
	rewrite(log_persona);
	crearpersona(aux);
	while (aux.ape<>'') do begin
		write(log_persona,aux);
		crearpersona(aux);
		end;
	close(log_persona);
end;

procedure opcion2(var log_persona:arch_persona);
var
	p:persona;
	mes:longint;
begin
	reset(log_persona);
	write('Ingrese el mes del que desea saber sus cumpleaños: ');readln(mes);
	read(log_persona,p);
	while(not eof(log_persona)) do begin
		read(log_persona,p);
		if ((((p.nac) mod 10000) div 100)=mes) then begin
			write(p.nom,' ');writeln(p.ape);
			end;
		end;
	close(log_persona);
end;

procedure opcion3(var log_persona:arch_persona);
var
	aux:persona;
begin
	reset(log_persona);
	crearpersona(aux);
	while(aux.ape<>'') do begin
		eof(log_persona);
		write(log_persona,aux);
		crearpersona(aux);
		end;
	close(log_persona);
end;

procedure opcion4(var log_persona:arch_persona);
var
	aux:persona;
	dada:string[15];
begin
	write('Ingrese la persona dada: ');readln(dada);
	reset(log_persona);
	while(not eof(log_persona)) do begin
		read(log_persona,aux);
		if (aux.ape = dada) then begin
			write('ingrese la nueva fecha de nacimiento (aaaammdd): ');readln(aux.nac);
			write(log_persona,aux);
			end;
		end;
	close(log_persona);
end;

procedure opcion5(var log_persona:arch_persona);
type
	personas= file of string[15];
var
    aux:persona;
	nombre:string[15];
	nuevolog: personas;
begin
	reset(log_persona);
	assign(nuevolog,'personas.txt');
	rewrite(nuevolog);
	while(not eof(log_persona)) do begin
		read(log_persona,aux);
		write(nuevolog,aux.nom);
		end;
	close(log_persona);
	while(not eof(nuevolog)) do begin
		read(nuevolog,nombre);
		writeln(nombre);
		end;
	close(nuevolog);
end;

VAR
	log_persona: arch_persona;
	op:char;
BEGIN
	write('Elija una opcion: 1 para crear el archivo, 2 para enlistarlo, 3 para añadir personas al final del archivo, 4 para modificar la fecha de nacimiento de una persona dada, 5 para crear y enlistarun nuevo archivo personas');readln(op);
	while (op <> '1') and (op <> '2') and (op <> '3') and (op <> '4') do write ('Error. Ingrese 1,2,3 o 4');
	case (op) of
		'1':opcion1(log_persona);
		'2':opcion2(log_persona);
		'3':opcion3(log_persona);
		'4':opcion4(log_persona);
        '5':opcion5(log_persona);
		end;
	readln;
	readln;
END.
