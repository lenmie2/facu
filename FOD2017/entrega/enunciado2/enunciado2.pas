{
Ejercicio 2
Se realizó una encuesta para las próximas elecciones universitarias y, con la información obtenida,
se generó un archivo que registra: código de facultad, código de carrera, año que cursa y agrupación
a la que votaría (codificada de 1 a 5). El mismo se encuentra ordenado por código de facultad, código de
carrera y año que cursa. Se pide obtener un listado en pantalla con el siguiente formato:
Facultad:
Carrera:
agrupación 1 agrupación 2 ......... agrupación 5
1er año .... .... ....
.....
.....
6to año
Total Carrera: ___
Carrera:
.....
.....
Total Carrera: ____
Total Facultad: ____
-------------------------------------------------------------------------------------
Facultad:
.....
.....
NOTAS:
-Implemente esto para solo 2 años, por falta de tiempo para hacer una base de datos de pruebas decente
-Soy conciente de que el proceso listar lo podria modularizar mas, no lo hice por falta de tiempo
-La falta la tiempo sucedio porque uno de los participantes se borro, esto lo podemos hacer mejor.

}
program Encuesta;
const
  valorAlto = 999;
type
 tipoVoto = record
               codFacu:integer;
               codCarr:integer;
               anioCarrera: integer;        
               agrupacion: integer;         
               end;

 tipoArchVoto= file of tipoVoto;
////
////
////
procedure leer(var archivo: tipoArchVoto;var registro: tipoVoto);
begin
  if(not eof(archivo)) then
    read(archivo,registro)
  else
    registro.codFacu:= valorAlto;
end;
////
////Procedimiento creado para agilizar el testeo. Este genera el archivo a trabajar
////
procedure crearArchivoDesdeTexto(var archivo: tipoArchVoto;dirBase:string);
var
  registro: tipoVoto;
  textoEncuesta: text;
begin
  assign(textoEncuesta,dirBase + '\TextoEncuesta.txt');
  reset(textoEncuesta);
  while (not eof(textoEncuesta)) do begin
    Readln(textoEncuesta,registro.codFacu,registro.codCarr,registro.anioCarrera,registro.agrupacion);
    write(archivo,registro);
  end;
  close(textoEncuesta);
  Writeln('Creacion finalizada');
end;
////
////
////
procedure listarEnPantalla(var archivo: tipoArchVoto);
var
  registro: tipoVoto;
  anioAct,carrAct,facuAct,totCarr,totFacu,i: integer;
  vectorAux: array[1..5] of integer;
begin
  seek(archivo,0);
  leer(archivo,registro);
  while (registro.codFacu <> valorAlto) do begin
    facuAct:= registro.codFacu;
    totFacu:= 0;
    Writeln('Facultad: ',registro.codFacu);
    while (facuAct = registro.codFacu) and (registro.codFacu <> valorAlto)do begin
      carrAct:= registro.codCarr;
      totCarr:= 0;
      writeln('Carrera: ',carrAct);
      write('     ');
      for i:= 1 to 5 do begin
        vectorAux[i]:= 0;
        write('agr',i,' '); //imprimo la matrix agrupacion/año
      end;
      writeln();
      while (carrAct = registro.codCarr) and (registro.codFacu <> valorAlto)do begin
        anioAct:= registro.anioCarrera;
        while (anioAct = registro.anioCarrera) and (registro.codFacu <> valorAlto) do begin //totaliza la linea de un año en un vector
          vectorAux[registro.agrupacion]:= vectorAux[registro.agrupacion] + 1;
          totCarr:= totCarr + 1;        
          leer(archivo,registro);          
        end;
        Write('Año ',anioAct,': ');
        for i:= 1 to 5 do begin
          Write(vectorAux[i],'    '); 
          vectorAux[i]:= 0;
        end;
        writeln();
      end;
      Writeln('Total Carrera ',carrAct,':',totCarr);
      totFacu:= totFacu + totCarr;
    end;
    Writeln('Total Facultad ',facuAct,':',totFacu);
    write('---------------------');readln();
    write('---------------------');readln();
  end;
end;
///
///
///
VAR
  archivo: tipoArchVoto;
  dirBase: string;
BEGIN {programa principal}
  assign(archivo,'D:\facu\fod2017\scr\TextoEncuesta');
  rewrite(archivo);
  writeln('Ingrese la direccion en la que estan ubicadas productos.txt y ventasX.txt: ');readln(dirBase);
  writeln();
 //dirBase:= 'D:\facu\fod2017\entrega\enunciado2';
  crearArchivoDesdeTexto(archivo,dirBase);
  listarEnPantalla(archivo);
  close(archivo);
  Write('/-Fin del programa-/');Readln();
END.
