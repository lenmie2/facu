
Las bajas se realizan apilando registros borrados y las altas reutilizando registros
borrados. El registro 0 se usa como cabecera de la pila de registros borrados: 0
implica que no hay registros borrados y N indica que el próximo registro a reutilizar es
el N, siendo éste un número relativo de registro válido.
Implemente el siguiente modulo:
{Abre el archivo y elimina el nombre recibido como parámetro manteniendo la
política descripta anteriormente}
program p3e5;
type
	tNombre = String[50];
	tArchPersonas = File of tNombre;

Procedure eliminar (var a: tArchPersonas; nombre: string);
var

	i,aux:integer;
	reg:string;
Begin
	reset(a);
	read(a,reg);
	StrtoInt(reg,aux);	
	while(reg <> nombre) do 
		read(a.reg)
	i:= filepos(a);
	InttoStr(aux,reg);
	seek(a,filepos(a)-1);
	write(a,reg);
	close(a);
end;