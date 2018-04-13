program p3e2;
uses crt;
const
	rutaDefault = 'D:\facu\fod2017\source\practica3';
type
	tipoPersona = record
		ape:	string[32];
		nom:	string[32];
		nac:	longint;		//formato aaaammdd
		end;

	tipoArchPersona = file of tipoPersona;

{Lectura y creacion de registro. Va a detenerse cuando se ingrese un
fecha de nacimiento = 0}
procedure leerRegistro(var registro: tipoPersona);
begin
	writeln('   --- Nuevo Registro Persona ---    ');
	write('Ingrese fecha de nacimiento: ');readln(registro.nac);
	if (registro.nac <> 0) then begin
		write('Ingrese nombre: ');readln(registro.nom);
		write('Ingrese apellido: ');readln(registro.ape);
	end;
end;
{Creacion de archivo. Utiliza el metodo leerRegistro para crear registros
se va a detener cuando se ingrese una fecha de nacimiento = 0}
procedure crearArchivo(var archivo: tipoArchPersona);
var
	registro: tipoPersona;
begin
	rewrite(archivo);
	leerRegistro(registro);
	while(registro.nac <> 0) do begin
		write(archivo,registro);
		leerRegistro(registro);
	end;
	close(archivo);
end;
{Dado un archivo de personas, lista en pantalla aquellas personas 
que hayan nacido en determinado mes o que posean la fecha de naci
miento igual a 0}
procedure listarEnPantalla(var archivo: tipoArchPersona);
var
	registro: tipoPersona;
	valorMes: integer;
begin
	reset(archivo);
	write('Ingrese un mes valido (1-12) y a continuacion se mostraran los registros relacionados');
	readln(valorMes);
	if (not eof (archivo)) then
		read(archivo,registro);
	while(not eof(archivo)) do begin
		//if((((registro.nac mod 10000))div 100) = valorMes) then begin
			writeln('	---	Registro de Persona ',filepos(archivo),' ---	');
			write('Nombre: ');write(registro.nom);
			write('. Apellido: ');write(registro.ape);
			write('. Fecha de nacimiento: ');writeln(registro.nac);
		//end;
		if (not eof (archivo)) then
			read(archivo,registro);
	end;
	close(archivo);
end;
{Dado un nombre y apellido, busca y localiza el registro en el archivo
si lo encuentra, lo intercambia con el registro final y trunca el 
archivo en uno, eliminandolo}
procedure eliminarTruncar(var archivo: tipoArchPersona);
var
	reg, regAux: tipoPersona;
	nomBusq, apeBusq: string[32];
	elimina: integer;
begin
        reset(archivo);
	writeln('Ingrese los datos del registro a buscar: ');
	write('Nombre:	');readln(nomBusq);
	write('Apellido: ');readln(apeBusq);
	elimina:= -1;
	if(not eof(archivo)) then
		read(archivo,reg);
	while((not eof(archivo)) and (elimina = -1)) do begin
                                writeln('***');
                if((reg.nom = nomBusq) and (reg.ape = apeBusq)) then
			elimina:= filepos(archivo)-1;
		if (not eof(archivo)) then
			read(archivo, reg);

	end;
	if(elimina <> -1) then begin
		seek(archivo, filesize(archivo)-1);
		read(archivo, regAux);
		seek(archivo, elimina);
		write(archivo, regAux);
		seek(archivo, filesize(archivo)-1);
		truncate(archivo);
	end
	else begin
		writeln(' - No se encontro el registro con la informacion especificada -');
		close(archivo);
	end;
end;
{Muestra el menu de opciones y envia la opcion elegida por parametro}
procedure mostrarMenu(var opcion: integer);
begin
	writeln('FOD 2017 - ejercicio 5 practica 1 ');
	writeln('Opcion 1: Crear archivo de personas ingresando desde el teclado');
	writeln('Opcion 2: Mostar personas en pantalla dado un mes ingresado');
	writeln('Opcion 3: Dado un nombre y apellido, elimina fisicamente el primer');
	writeln('		   registro encontrado si es que existe');
	write('Elije una opcion: ');readln(opcion);
end;
{Programa Principal. Se asigna el archivo aca, se abre y manipula en cada 
proceso por separado}
var
	archivo: tipoArchPersona;
	opcion: integer;
begin
	assign(archivo,rutaDefault+'\archivoPersonas.dat');
	mostrarMenu(opcion);
	case(opcion) of
		1: crearArchivo(archivo);
		2: listarEnPantalla(archivo);
		3: eliminarTruncar(archivo);
	end;
	writeln('	----- Programa Finalizado ----- ');readln;
end.
