{Ejercicio 1
  El encargado de ventas de un negocio de productos de limpieza desea
  administrar el stock de los productos que vende. Para ello, genera un archivo
  maestro donde figuran todos los productos que comercializa. De cada producto
  se maneja la siguiente información: código de producto, nombre comercial,
  precio de venta, stock actual y stock mínimo. Diariamente se generan los archivos
  detalle donde se registran todas las ventas de productos realizadas. De cada
  venta se registra: código de producto y cantidad de unidades vendidas. Se pide
  realizar un programa con opciones para:
  ? Crear el archivo maestro a partir de un archivo de texto llamado
  “productos.txt”.
  ? Listar el contenido del archivo maestro en un archivo de texto llamado
  “reporte.txt”, listando de a un producto por línea.
  ? Crear un archivo detalle de ventas a partir de un archivo de texto llamado
  “ventasX.txt”, donde X=1..30.
  ? Listar en pantalla el contenido de un archivo detalle dado.
  ? Actualizar el archivo maestro con 30 archivos detalle, sabiendo que:
  ? Todos los archivos están ordenados por código de producto.
  ? Cada registro del maestro puede ser actualizado por 0, 1 ó más
  registros de los archivos detalle.
  ? Los archivos detalle sólo contienen registros que están en el archivo
  maestro.
  ? Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos
  cuyo stock actual esté por debajo del stock mínimo permitido.
  La cantidad de archivos detalle debe estar parametrizada.
  }
program EjercicioUno;
Uses sysutils;
const
	valorAlto= 9999;
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

	tipoVectorVentas = array[0..29] of tipoVenta; // tipoVectorVentas que posee treinta archivos de tipo tipoProducto.
	tipoVectorArchVentas = array[0..29] of tipoArchVenta; //tipoVectorVentas que contiene los treinta tipoArchVentas ( que son de tipo tipoVenta).
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
	pos,i: integer;
begin
	for i:= 0 to 29 do begin
		//Read(vectorDetalles[i],regDet);
		if(vectorRegistros[i].codigo < regMin.codigo) then begin
			pos:=i;
			regMin:= vectorRegistros[i];
      	end;
      	leer(vectorDetalles[pos],vectorRegistros[pos]);
    end;
end;
////
////
////
procedure ListarOpciones(var opcion: char);
begin
	Writeln('Seleccione opcion: ');
	Writeln('a)Crear archivo Maestro de productos a partir deun archivo de texto.');
	Writeln('b)Listar el contenido del archivo Maestro en un archivo de texto.');
	Writeln('c)Crear un archivo detalle de venta a partir de un archivo de texto llamado tipoVentaX.txt�, donde X=0..29');
	Writeln('d)Listar en pantalla el contenido de un archivo detalle dado.');
	Writeln('e)Actualizar el archivo maestro con 30 archivos tipoArchVenta.');
	Writeln('f)Listar en un archivo de texto llamado reporte_stock_minimo.txt aquellos productos cuyo stock actual esta por debajo del stock minimo permitido.');
	Write('Seleccion elegida:');Readln(opcion);
end;
////
////
////
procedure Importar( var maestro: tipoArchProducto); //Creacion del archivo tipoArchProducto.
var
	regMa: tipoProducto;
	textoMaestro:text;
begin
	Assign(maestro,'D:\facu\fod2017\scr\PracticaFOD2017archivo.dat');
	Assign(textoMaestro,'D:\facu\fod2017\scr\PracticaFOD2017tipoProductos.txt');
	rewrite(maestro);
	reset(textoMaestro);	
	While(not eof(textoMaestro))do begin
        Readln(textoMaestro,regMa.codigo,regMa.precio,regMa.stockActual,regMa.stockMinimo,regMa.nombre);
        Write(maestro,regMa);
		end;
	Writeln('Carga de registro exitosa.');
	close(textoMaestro);
end;
////
////
////
procedure listarReporte( var maestro: tipoArchProducto); //Exportar; en Reporte.txt el archivo tipoArchProducto.
var
  registro: tipoProducto;
  textoMaestro: text;
begin
	Assign(maestro,'D:\facu\fod2017\scr\PracticaFOD2017archivo.dat');
	reset(maestro);

  	assign(textoMaestro,'D:\facu\fod2017\scr\PracticaFOD2017reporte.txt');
	rewrite(textoMaestro);
	seek(maestro,0);
	While(not eof(maestro))do begin
    	Read(maestro,registro);
    	WriteLn(textoMaestro,registro.codigo);
    	Writeln(textoMaestro,registro.precio);
    	Writeln(textoMaestro,registro.stockActual);
    	Writeln(textoMaestro,registro.stockMinimo);
    	Writeln(textoMaestro,registro.nombre);
  		end;
	Writeln('Reporte exitoso.');
	close(textoMaestro);
end;
////
////Crea un detalleX en un lugar especifico del vector de detalles, a partir del textoDetalleX correspondiente
////
procedure crearUnArchivotipoArchVenta(var vectorDetalles:tipoVectorArchVentas);
var
	registro:tipoVenta;
	i: integer;
	textoDetalle: text;
begin
	Write('Ingrese posicion en que quiere crear un archivo: ');Readln(i);
	Assign(textoDetalle,'D:\facu\fod2017\scr\PracticaFOD2017tipoVenta'+IntToStr(i)+'.txt');
	Assign(vectorDetalles[i],'D:\facu\fod2017\scr\PracticaFOD2017Vendidos'+IntToStr(i)+'.dat');
	rewrite(vectorDetalles[i]);
	reset(textoDetalle);
	While(not eof(textoDetalle))do begin
    	Readln(textoDetalle,registro.codigo,registro.vendidas);
    	Write(vectorDetalles[i],registro);
		end;
	close(vectorDetalles[i]);
	close(textoDetalle);
end;
////
////
////
procedure listadoEspecifico( var vectorDetalles:tipoVectorArchVentas);
var
	regDet: tipoVenta;
         i: integer;
begin
	Write('Ingrese posicion que quiere mostrar por pantalla: ');Readln(i);
	Assign(vectorDetalles[i],'D:\facu\fod2017\scr\PracticaFOD2017Vendidos'+IntToStr(i)+'.dat');
	reset(vectorDetalles[i]);
	leer(vectorDetalles[i],regDet);
	while (regDet.codigo <> valorAlto) do begin
		Writeln('Codigo de producto: ',regDet.codigo );
		Writeln('Cantidad de ventas del producto: ',regDet.vendidas );
		end;
	Writeln('Listado por pantalla exitoso.');
	close(vectorDetalles[i]);
end;
////
////
////
procedure actualizartipoArchProducto(var maestro:tipoArchProducto; var vectorDetalles:tipoVectorArchVentas);

var
	vectorRegistros:tipoVectorVentas;
	regMin:	tipoVenta;
	regMae:	tipoProducto;
	i,codActual, totCant:	integer;
begin
	Assign(maestro,'D:\facu\fod2017\scr\PracticaFOD2017archivo.dat');
	reset(maestro);
	//asignacion de detalles
	for i:= 0 to 29 do begin
		Assign(vectorDetalles[i],'D:\facu\fod2017\scr\PracticaFOD2017produc'+IntToStr(i)+'.dat');
		reset(vectorDetalles[i]);
		leer(vectorDetalles[i],vectorRegistros[i]); // carga el primer registro de los detalle
		end;
	//el archivo se recorre por los registros minimo
	regMin.codigo:=valorAlto;
	minimo(regMin, vectorRegistros, vectorDetalles);
	read(maestro, regMae); // cargo el primer registro del maestro
	While(regMin.codigo <> valorAlto)do begin
		totCant:= 0;
		codActual:= regMin.codigo;

		While(regMin.codigo = codActual)do begin
			totCant:= totCant + regMin.vendidas;
			minimo(regMin, vectorRegistros, vectorDetalles);
			end;
		//read(maestro, regMae);
		while (regMae.codigo <> regMin.codigo) do read(maestro,regMae);
		regMae.stockActual := regMae.stockActual - totCant;	
		seek(maestro,filePos(maestro)-1);
		Write(maestro,regMae);
        if (not EOF (maestro)) then read(maestro, regMae); // actualizo el regMae para la proxima iteracion
		end;
	Writeln('Actualizacion exitosa.');
	for i:= 0 to 29 do
     close(vectorDetalles[i]);
end;
////
////
////
procedure listarStockActualBajo(var maestro:tipoArchProducto);
var
	regMa:tipoProducto;
	textoReporte:text;
begin
	Assign(maestro,'D:\facu\fod2017\scr\PracticaFOD2017archivo.dat');
	reset(maestro);

	Assign(textoReporte,'D:\facu\fod2017\scr\PracticaFOD2017stock_minimo.txt');
	rewrite(textoReporte);
	seek(maestro,0);
    Read(maestro,regMa);
    while (not eof(maestro)) do begin
		if(regMa.stockActual < regMa.stockMinimo)then
		Writeln(textoReporte,'codigo: ', regMa.codigo,' precio:', regMa.precio,'stock Actual : ', regMa.stockActual,'Stock Minimo : ',regMa.stockMinimo,'nombre: ',regMa.nombre);
      	read(maestro,regMa);
    	end;
    Writeln('Exportacion exitosa.');
	close(textoReporte);
end;
///
///proceso implementado para agilizar el testeo
///
procedure crearTodosLosDetalles(var vectorDetalles:tipoVectorArchVentas);
var
	registro:tipoVenta;
	i: integer;
	textoDetalle: text;
begin
	for i := 0 to 29 do begin
		Assign(textoDetalle,'D:\facu\fod2017\scr\PracticaFOD2017tipoVenta'+IntToStr(i)+'.txt');
		Assign(vectorDetalles[i],'D:\facu\fod2017\scr\PracticaFOD2017Vendidos'+IntToStr(i)+'.dat');
		rewrite(vectorDetalles[i]);
		reset(textoDetalle);
		While(not eof(textoDetalle))do begin 				//crea un detalle i 
    		Readln(textoDetalle,registro.codigo,registro.vendidas);
    		Write(vectorDetalles[i],registro);
		end;
		close(vectorDetalles[i]);
		close(textoDetalle);
	end;

end;

////
////PROGRAMA PRINCIPAL
////
VAR
   maestro:tipoArchProducto;
   vectorDetalles:tipoVectorArchVentas;
   opci:char;
BEGIN
 listarOpciones(opci);
	case(opci)of
		'a': Importar(maestro);
		'b': listarReporte(maestro);
		'c': crearTodosLosDetalles(vectorDetalles);
		'd': listadoEspecifico(vectorDetalles);
		'e': actualizartipoArchProducto(maestro,vectorDetalles);
		'f': listarStockActualBajo(maestro);
    else 
		Writeln('Seleccion inválida.'); 
  end;
	close(maestro);
	Readln();
	Readln();
END.


