program p2e2;
const
	valoralto = 9999;
type
	alumno = record
		cod: String[20];
		nom: String[20];
		ape: String[20];
		confinal: String[20];
		sinfinal: String[20];
		end;		
	
	modificaciones = record
		cod : string[20];
		confinal : Boolean;
	end;


	Facultad = file of alumno;
	Detalle = file of modificaciones; 

procedure Leer(var archivo:Facultad;var reg:modificaciones);
begin
	if (not eof(archivo)) then
		read(archivo,reg)
	else
		reg.cod:= valoralto;
end;

procedure CrearReg(var reg:alumno; var texto:txt); //proceso agarra el archivo previamente abierto, agarra 5 lineas y crea un reg. deja el puntero en el nom del siguiente reigsto
var
	linea: string[20];
begin
	if (not eof(texto)) then
		readln(texto,linea);
		reg.cod:= linea;
		readln(texto,linea);
		reg.nom:= linea;
		readln(texto,linea);
		reg.ape:= linea;
		readln(texto,linea);
		reg.confinal:= linea;	
		readln(texto,linea);
		reg.sinfinal:= linea;
		readln(texto,linea);
	else
		reg.cod:= valoralto;
end;

procedure OpcionA(var archivo: Facultad);
var
	texto: txt;
	reg: alumno;	
begin
	assign(archivo,'ListaAlumnos');
	assign(texto,'alumnos.txt');
	rewrite(archivo);
	reset(texto);
	CrearReg(texto,reg);
	while (reg.cod <> valoralto) do begin
		write(archivo,reg);
		CrearReg(texto,reg);
		end;
	close(archivo);
	close(texto);
end;

procedure CrearReg2(var reg:modificaciones; var texto:txt);
var
	linea: string;
begin
	if (not eof(texto)) then begin
		readln(texto,linea);
		reg.cod:= linea;
		readln(texto,linea);
		if (linea = 'si') then 
			reg.confinal:= true
		else
			reg.confinal:= false;
	else
		reg.cod:=valoralto;
	end;
end;

procedure OpcionB(var de: Detalle);
var
	texto: txt;
	reg: modificaciones;
begin
	assign(texto,'textoDetalle.txt');
	assign(de,'ArchivoDetalle');
	reset(texto);
	rewrite(de);
	CrearReg2(reg,texto);
	while(reg.cod <> valoralto) do begin
		write(de,reg);
		CrearReg2(reg,texto);
		end;
	close(de);
	close(texto);
end;

procedure OpcionC(var archivo: Facultad);
var
	reg: alumno;
begin
	assign(archivo,'ListaAlumnos');
	reset(archivo);
	Leer(archivo,reg);
	while(reg.cod <> valoralto) do begin
		CrearReg(reg);
		Leer(archivo,reg);
		end;
	close(archivo);
end;

procedure OpcionD(var de:Detalle);
var
	reg: modificaciones;
begin
	assign(de,'ArchivoDetalle');
	reset(de);
	Leer(de,reg);
	while(reg.cod <> valoralto) do begin
		CrearReg2(reg);
		Leer(archivo,reg);
		end;
	close(archivo);
end;

procedure OpcionE(var archivo: Facultad;var de:Detalle);
var
	reg: alumno; regDet,auxDet: modificaciones;
	auxCod: string[20];
begin
	assign(archivo,'ListaAlumnos');
	reset(archivo);
	assign(de,'ArchivoDetalle');
	reset(de);
	Leer(archivo,regDet);
	while (regDet.cod <> valoralto) do begin
		auxDet.confinal:= 0;
		auxDet.sinfinal:= 0;
		auxCod:= regDet.cod;
		while (regDet.cod = auxCod) do begin
			if (regDet.confinal) then
				auxDet.confinal:= auxDet.confinal+1;
			else
				auxDet.sinfinal:= auxDet.sinfinal+1;
			Leer(archivo,regDet);
			end;
		while (reg.cod <> auxCod) do
			read(archivo,re);
		reg.confinal:= reg.confinal+auxDet.confinal;
		reg.sinfinal:= reg.sinfinal+auxDet.sinfinal;
		seek(archivo,filepos(archivo)-1);
		write(archivo,reg);
		end;
	close(archivo);
	close(de);
	end;

procedure OpcionF(var archivo:Facultad);
var
	textoSinAprobar: txt;
	reg: alumno;
begin
	assign(texto,'textoSinAprobar4.txt');
	assign(archivo,'ListaAlumnos');
	rewrite(texto);
	reset(archivo);
	Leer(archivo,reg);
	while (reg.cod <> valoralto) do begin
		if(reg.sinfinal>4) then
			EscribirReg(reg,texto); // el proceso va a escribir las lineas del reg en el texto
			writeln(reg.cod,' ',reg.nom);
		Leer(archivo);
		end;
	close(texto);
	close(archivo);
end;

var
	archivo: Facultad;
	de:Detalle;
	opcion: char;
begin
	write('ingrese una opcion: ');readln(opcion);
	case opcion of
		'A': OpcionA;
		'B': OpcionB;
		'C': OpcionC;
		'D': OpcionD;
		'E': OpcionE;
		'F': OpcionF;
		end;
end.