program p3e1;
uses crt;
const
	valorAlto = 999;
type
	producto = record
		cod : Integer;
		nom : string[64];
		cact: integer;
		cmin: integer;
		cmax: integer;
		prec: real;
	end;
	
	tipoArchivoProducto = file of producto;

procedure leer(var maestro: tipoArchivoProducto; var reg: producto);
begin
	if (not eof(maestro)) then
		read(maestro, reg)
	else 
		reg.cod:= valorAlto;
end;

procedure leerReg(var reg: producto);
begin
	writeln('// Nuevo Producto //');
	write('Ingrese nombre: ');readln(reg.nom);
	write('Ingrese codigo: ');readln(reg.cod);
	write('Ingrese cantidad maxima: ');readln(reg.cmax);
	write('Ingrese cantidad minima: ');readln(reg.cmin);
	write('Ingrese cantidad actual: ');readln(reg.cact);
	write('Ingrese precio: ');readln(reg.prec);
	writeln();	
end;

procedure modificarReg(var reg: producto);
begin
	writeln('// Modificar Producto //');
	write('Ingrese nombre: ');readln(reg.nom);
	write('Ingrese cantidad maxima: ');readln(reg.cmax);
	write('Ingrese cantidad minima: ');readln(reg.cmin);
	write('Ingrese cantidad actual: ');readln(reg.cact);
	write('Ingrese precio: ');readln(reg.prec);
	writeln();
end;
//
//ALTA: se lee el primer registro, si es 0, se va a escribir el nuevo registro al final del archivo
//si este es negativo, va a buscar por la pila el ultimo nodo borrado.
//esto es, obtener el codigo, ir a la posicion, guardar el registro del siguiente tope pila, e intercambiarlo
//con el registro cabecera
//
procedure Alta(var maestro: tipoArchivoProducto);
var
	regAux, regNew: producto;
begin
	leerReg(regNew);
	read(maestro, regAux);
	if (regAux.cod < 0) then begin
		seek(maestro, (regAux.cod * -1));
		read(maestro,regAux);

		seek(maestro, filepos(maestro) -1);
		write(maestro,regNew);

		seek(maestro, 0);
		write(maestro, regAux);
		end
	else begin
		seek(maestro, filesize(maestro));
		write(maestro, regNew);
		end;
end;
///
///Recorre el maestro en busca de un codigo ingresado, y retorna el registro encontrado, y el maestro apuntado al mismo
// No contempla el caso de se ingrese un codigo que no exista (por ahora)
///
procedure buscarRegistro(var maestro: tipoArchivoProducto;var regMa: producto;var pos: integer);
var
	busqCodigo: integer;
begin
	write('Ingrese el codigo del producto: ');readln(busqCodigo);
	read(maestro,regMa);
	while ((not eof(maestro)) and (regMa.cod <> busqCodigo)) do
		read(maestro,regMa);
	pos:= filepos(maestro);
end;
//
//BAJA: se copia el registro cabecera(osea el ultimo tope pila), se busca la posicion a borrar
//y se intercambia registros con el cabecera. El resultado va a ser que el registro a borrar
//va a quedar en el cabera como nuevo tope pila
//
procedure Baja(var maestro: tipoArchivoProducto);
var
	regAux, regDel: producto;
	posAux: integer;
begin	
	seek(maestro,0);
	read(maestro, regAux);		//leo el cabecera. tenga o no tenga archivos ya borrados se va a copiar
	
	buscarRegistro(maestro,regDel,posAux);  //el puntero va a estar sobre el archivo a aborrar

	seek(maestro, filepos(maestro)-1);
	write(maestro, regAux);		//sobre escribo con el cabecera
	seek(maestro,0);			//cambio el valor a negativo y escribo en cabecera
	regDel.cod:= posAux*-1;
	write(maestro,regDel);
 write('--Registro,',posAux,' borrado');readln();
end;
//
//MODIFICAR REGISTRO: simplemente se busca la posicion del registro a modificar, se crea un nuevo
//registro con el mismo codigo y se lo sobreescribe
//
procedure Modif(var maestro: tipoArchivoProducto);
var
	regAux: producto;
	pos: integer;
begin
	buscarRegistro(maestro,regAux,pos);
	modificarReg(regAux);
	seek(maestro,filepos(maestro)-1);
	write(maestro, regAux);
	write('/// archivo modificado exitosamente');readln();
end;
//
//LISTAR: exporta todo a un txt
//
procedure Listar(var maestro: tipoArchivoProducto);
var
	regAux: producto;
	texto: text;
begin
	assign(texto, 'D:\facu\fod2017\scr\reporte_productos.txt');
	rewrite(texto);
	seek(maestro,1);		//se evita el registro cabecera
	leer(maestro, regAux);
	while (regAux.cod <> valorAlto) do begin
		writeln(texto, regAux.nom);
		writeln(texto, regAux.cod);
		writeln(texto);
		leer(maestro, regAux)	
	end;
	close(texto);
	write('/// archivo reporte creado ///');readln();
end;

procedure crearArchivo(var maestro: tipoArchivoProducto);
var
	regMa: producto;
	texto: text;
begin
	writeln('/// Creando archivo.. ///');
	assign(texto,'D:\facu\fod2017\scr\productosp3e1.txt');
	assign(maestro,'D:\facu\fod2017\scr\p3e1');
	reset(texto);
	rewrite(maestro);

	regMa.cod:= 0;
	write(maestro,regMa);
	
	while (not eof(texto)) do begin
		readln(texto,regMa.nom);
		readln(texto,regMa.cod,regMa.cmin,regMa.cmax,regMa.cact);
		write(maestro, regMa);		
	end;
	close(texto);
 write('/// Archivo Creado ///)');readln();
end;

procedure abrirArchivo(var maestro: tipoArchivoProducto);
var
	nombreFis: string;
begin
	write('Ingrese el nombre fisico del archivo a abrir: ');//aqui iria readln(nombreFis)
	nombreFis:= 'D:\facu\fod2017\scr\p3e1';
	assign(maestro,nombreFis);
	reset(maestro);
end;

procedure mostrarOpciones(var opcion: integer);
begin
	writeln('// Elija una opcion entre las siguientes //');
	writeln('1- Dar de alta un registro');
	writeln('2- Dar de baja un registro');
	writeln('3- Modificar un registro');
	writeln('4- Listar todo en un archivo de texto');
	write('opcion: ');readln(opcion);
end;

//PROGRAMA PRINCIPAL
var
	maestro: 	tipoArchivoProducto;
	opcion:		integer;
begin
	write('Ingrese 1 si desea crear un nuevo archivo, de lo contrario ingrese cualquier tecla: ');readln(opcion);
	if (opcion = 1) then 
		crearArchivo(maestro)
	else
		abrirArchivo(maestro);
	mostrarOpciones(opcion);
	case (opcion) of
		1: Alta(maestro);
		2: Baja(maestro);
		3: Modif(maestro);
		4: Listar(maestro);
	end;
	close(maestro);
end.

