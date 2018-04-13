{Ejercicio 1
  El encargado de ventas de un negocio de productos de limpieza desea
  administrar el stock de los productos que vende. Para ello, genera un archivo
  maestro donde figuran todos los productos que comercializa. De cada producto
  se maneja la siguiente informacion: codigo de producto, nombre comercial,
  precio de venta, stock actual y stock mÃ­nimo. Diariamente se generan los archivos
  detalle donde se registran todas las ventas de productos realizadas. De cada
  venta se registra: codigo de producto y cantidad de unidades vendidas. Se pide
  realizar un programa con opciones para:
  - Crear el archivo maestro a partir de un archivo de texto llamado
  "productos.txt"
  - Listar el contenido del archivo maestro en un archivo de texto llamado
  "reporte.txt", listando de a un producto por linea.
  - Crear un archivo detalle de ventas a partir de un archivo de texto llamado
  "ventasX.txt", donde X=1..30.
  - Listar en pantalla el contenido de un archivo detalle dado.
  - Actualizar el archivo maestro con 30 archivos detalle, sabiendo que:
	Todos los archivos estan ordenados por codigo de producto.
  - Cada registro del maestro puede ser actualizado por 0, 1 o mas
  registros de los archivos detalle.
  - Los archivos detalle solo contienen registros que estan en el archivo
  maestro.
  - Listar en un archivo de texto llamado stock_minimo.txtâ aquellos productos
  cuyo stock actual esta por debajo del stock minimo permitido.
  La cantidad de archivos detalle debe estar parametrizada.
  }
program EjercicioUno;
Uses sysutils;
const
	valorAlto = 9999;
	arrTamanio = 30;
type
    tipoProducto = record
			codigo:integer;
			nombre:string[50];
			precio:real;
			stockActual:integer;
			stockMinimo:integer;
			end;
	tipoVenta = record
			codigo:integer;
			vendidas:integer;
			end;
	tipoArchProducto = file of tipoProducto;
	tipoArchVenta = file of tipoVenta;

	tipoVectorVentas = array[1..arrTamanio] of tipoVenta; // tipoVectorVentas que posee treinta archivos de tipo tipoProducto.
	tipoVectorArchVentas = array[1..arrTamanio] of tipoArchVenta; //tipoVectorVentas que contiene los treinta tipoArchVentas ( que son de tipo tipoVenta).
////
////
////
procedure leer(var archivo:tipoArchVenta; var registro: tipoVenta);  //Leo el contenido de una celda del tipoVectorVentas tipo tipoArchVenta
begin
    if( not eof (archivo))then
		read(archivo,registro)
	else
		registro.codigo:= valorAlto;
end;
////
////
////
procedure minimo(var regMin:tipoVenta ;var vectorRegistros:tipoVectorVentas;var vectorDetalles:tipoVectorArchVentas);
var
	minCod,posMin,i: integer;
begin
	minCod:= valorAlto;  		
	for i:= 1 to arrTamanio do begin
		if(vectorRegistros[i].codigo < minCod) then begin
			posMin:= i;
			minCod:= vectorRegistros[i].codigo;
      	end;
    end;
    regMin:= vectorRegistros[posMin];
    leer(vectorDetalles[posMin],vectorRegistros[posMin]);		

end;
////
////
////
procedure actualizartipoArchProducto(var maestro:tipoArchProducto; var vectorDetalles:tipoVectorArchVentas;dirBase:string);
var
	vectorRegistros:tipoVectorVentas;
	regMin:	tipoVenta;
	regMae:	tipoProducto;
	i,codActual, totCant: integer;
begin
	Assign(maestro,dirBase + '\archivoMaestro.dat');
	reset(maestro);
	for i:= 1 to arrTamanio do begin 	//asignacion de detalles
		Assign(vectorDetalles[i],dirBase + '\detalle'+IntToStr(i)+'.dat');
		reset(vectorDetalles[i]);
		leer(vectorDetalles[i],vectorRegistros[i]); // carga el primer registro de cada uno de los detalles
	end;
	read(maestro, regMae); // cargo el primer registro del maestro
	minimo(regMin, vectorRegistros, vectorDetalles);  //aplico primer minimo
	While(regMin.codigo <> valorAlto)do begin //el proceso recorre todos los detalles utlizando el proceso minimo
		totCant:= 0;
		codActual:= regMin.codigo;
		While(regMin.codigo = codActual)do begin
			totCant:= totCant + regMin.vendidas;
			minimo(regMin, vectorRegistros, vectorDetalles);
		end;
		while (regMae.codigo <> codActual) do read(maestro,regMae);
		regMae.stockActual := regMae.stockActual - totCant;	
		if (regMae.stockActual < 0) then regMae.stockActual:= 0;
		seek(maestro,filePos(maestro)-1);
		Write(maestro,regMae);
        if (not EOF (maestro)) then read(maestro, regMae); // actualizo el regMae para la proxima iteracion
	end;
	Writeln('-----Actualizacion exitosa-----');Readln();
	for i:= 1 to arrTamanio do close(vectorDetalles[i]);
	close(maestro);
end;
/////
/////
/////
procedure ListarOpciones(var opcion: char);
begin
	writeln();
	Writeln('--------------------------------------Opciones----------------------------------');
	Writeln('a) Crear archivo Maestro de productos a partir de un archivo de texto.');writeln();
	Writeln('b) Listar el contenido del archivo Maestro en un archivo de texto.');writeln();
	Writeln('c) Crear un archivo detalle de venta a partir de un archivo de texto llamado ventaX.txt, donde X=1..30(el proceso implementado crea todos los detalles al mismo tiempo)');writeln();
	Writeln('d) Listar en pantalla el contenido de un archivo detalle dado.');writeln();
	Writeln('e) Actualizar el archivo maestro con 30 archivos venta.');writeln();
	Writeln('f) Listar en un archivo de texto llamado reporte_stock_minimo.txt aquellos productos cuyo stock actual esta por debajo del stock minimo permitido.');writeln();
	writeln('z) Salir');writeln();
	Write('Seleccion elegida: ');Readln(opcion);WriteLn();
end;
////
////
////
procedure Importar( var maestro: tipoArchProducto;dirBase:string); //Creacion del archivo tipoArchProducto.
var
	regMa: tipoProducto;
	textoMaestro:text;
begin
	
	Assign(maestro,dirBase + '\archivoMaestro.dat');
	Assign(textoMaestro,dirBase + '\productos.txt');
	rewrite(maestro);
	reset(textoMaestro);	
	While(not eof(textoMaestro))do begin
        Readln(textoMaestro,regMa.codigo,regMa.precio,regMa.stockActual,regMa.stockMinimo,regMa.nombre);
        Write(maestro,regMa);
		end;
	Writeln('-----Carga de archivo exitosa-----');readln();
	close(textoMaestro);
	close(maestro);	
end;
////
////
////
procedure listarReporte( var maestro: tipoArchProducto;dirBase:string); //Exportar; en Reporte.txt el archivo tipoArchProducto.
var
  registro: tipoProducto;
  textoMaestro: text;
begin;
	Assign(maestro,dirBase + '\archivoMaestro.dat');
	reset(maestro);
  	assign(textoMaestro,dirBase + '\reporte.txt');
	rewrite(textoMaestro);
	seek(maestro,0);
	While(not eof(maestro))do begin
    	Read(maestro,registro);
    	WriteLn(textoMaestro,registro.codigo,' ',registro.precio,' ',registro.stockActual,' ',registro.stockMinimo,' ',registro.nombre);
  		end;
	Writeln('-----Reporte exitoso.-----');readln();
	close(textoMaestro);
	close(maestro);
end;
////
////Crea un detalleX en un lugar especifico del vector de detalles, a partir del textoDetalleX correspondiente
////
procedure crearUnArchivotipoArchVenta(var vectorDetalles:tipoVectorArchVentas;dirBase:string);
var
	registro:tipoVenta;
	i: integer;
	textoDetalle: text;
begin
	
	Write('Ingrese posicion en que quiere crear un archivo: ');Readln(i);
	Assign(textoDetalle,dirBase + '\ventas'+IntToStr(i)+'.txt');
	Assign(vectorDetalles[i],dirBase + 'detalle'+IntToStr(i)+'.dat');
	rewrite(vectorDetalles[i]);
	reset(textoDetalle);
	While(not eof(textoDetalle))do begin
    	Readln(textoDetalle,registro.codigo,registro.vendidas);
    	Write(vectorDetalles[i],registro);
		end;
	close(vectorDetalles[i]);
	close(textoDetalle);
	Writeln('-----creacion de detalle ',i,' exitoso-----');Readln();
end;
////
////
////
procedure listadoEspecifico( var vectorDetalles:tipoVectorArchVentas;dirBase:string);
var
	regDet: tipoVenta;
	i: integer;
begin
	
	Write('Ingrese el numero del detalle que quiere mostrar por pantalla: ');Readln(i);
	Assign(vectorDetalles[i],dirBase + '\detalle'+IntToStr(i)+'.dat');
	reset(vectorDetalles[i]);
	leer(vectorDetalles[i],regDet);
	while (regDet.codigo <> valorAlto) do begin
		Writeln('Codigo de producto: ',regDet.codigo );
		Writeln('Cantidad de ventas del producto: ',regDet.vendidas );
		leer(vectorDetalles[i],regDet);
		end;
	close(vectorDetalles[i]);
	Writeln('-----Listado por pantalla exitoso-----');Readln();
end;
////
////
////
procedure listarStockActualBajo(var maestro:tipoArchProducto;dirBase:string);
var
	regMa:tipoProducto;
	textoReporte:text;
begin
	
	Assign(maestro,dirBase + '\archivoMaestro.dat');
	reset(maestro);
	Assign(textoReporte,dirBase + '\stock_minimo.txt');
	rewrite(textoReporte);
	seek(maestro,0);
	while (not eof(maestro)) do begin
    	Read(maestro,regMa);
		if(regMa.stockActual < regMa.stockMinimo)then
			Writeln(textoReporte,'codigo: ', regMa.codigo,' precio:', regMa.precio,' Stock Actual : ', regMa.stockActual,' Stock Minimo : ',regMa.stockMinimo,' nombre: ',regMa.nombre);
   	end;
    Writeln('-----Reporte de stocks bajos exitoso-----');Readln();
	close(textoReporte);
	close(maestro);
end;
///
///proceso implementado (que reemplaza a la opcion c) para agilizar el testeo
///
procedure crearTodosLosDetalles(var vectorDetalles:tipoVectorArchVentas;dirBase:string);
var
	registro:tipoVenta;
	i: integer;
	textoDetalle: text;
begin
	for i := 1 to arrTamanio do begin
		Assign(textoDetalle,dirBase + '\ventas'+IntToStr(i)+'.txt');
		Assign(vectorDetalles[i],dirBase + '\detalle'+IntToStr(i)+'.dat');
		rewrite(vectorDetalles[i]);
		reset(textoDetalle);
		While(not eof(textoDetalle))do begin 				//crea un detalle i 
    		Readln(textoDetalle,registro.codigo,registro.vendidas);
    		Write(vectorDetalles[i],registro);
		end;
		close(vectorDetalles[i]);
		close(textoDetalle);
	end;
	writeln('-----',arrTamanio,' detalles creados exitosamente-----');Readln();
end;

////
////PROGRAMA PRINCIPAL
////
VAR
   maestro:tipoArchProducto;
   vectorDetalles:tipoVectorArchVentas;
   opci:char;
   dirBase: string;
BEGIN
	writeln('Ingrese la direccion en la que estan ubicadas productos.txt y ventasX.txt: ');readln(dirBase);
	writeln();
	listarOpciones(opci);
	//dirBase:= 'D:\facu\fod2017\entrega\enunciado1';
	repeat begin
		case(opci)of
			'a': Importar(maestro,dirBase);
			'b': listarReporte(maestro,dirBase);
			'c': crearTodosLosDetalles(vectorDetalles,dirBase);
			'd': listadoEspecifico(vectorDetalles,dirBase);
			'e': actualizartipoArchProducto(maestro,vectorDetalles,dirBase);
			'f': listarStockActualBajo(maestro,dirBase);
		else 
			Writeln('Seleccion invalida.');readln();
		end;
		writeln();listarOpciones(opci);
	end;
	until opci = 'z';
	writeln('----------Programa Finalizado----------');Readln();
	close(maestro);
	Readln();
END.


