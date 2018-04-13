Las bajas se realizan apilando registros borrados y las altas reutilizando registros
borrados. El registro 0 se usa como cabecera de la pila de registros borrados: 0
implica que no hay registros borrados y N indica que el próximo registro a reutilizar es
el N, siendo éste un número relativo de registro válido.
Implemente el siguiente módulo:
{Abre el archivo y agrega el nombre recibido como parámetro manteniendo la
política descripta anteriormente}

program p3e4;
Type
	tNombre = String[50];
	tArchPersonas = File of tNombre;

Procedure agregar (var a: tArchPersonas; nombre: string);
var

	i,aux:integer;
	reg:string;
Begin
	reset(a);
	read(a,reg);
	value(reg,aux); //convierte un string a integer, luego chequear cual es la funcion coreccta;
	if (aux <> 0) then begin
		for i:=1 to aux do 
			read(a,reg);		
		seek(a,filepos(a)-1);
		write(a,nombre);
		reset(a);
		write(a,reg);
	else
		seek(a,filelength);
		write(a,nombre);
		end;
	close(a)
end;
