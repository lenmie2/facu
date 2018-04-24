TAD tipoPila;
	Uses tipoCelular;
interface
	type exportado pila;

	procedure st_create(var p:pila);
	procedure st_push(var p:pila; elem:celular);
	procedure st_pop(var p:pila; var elem:celular);
	procedure st_top(p: pila; var elem:celular);
	function st_lenght(p: pila): integer;
	function st_empty(p: pila): boolean;

implementacion
	
	piladatos= ^nodo;
	nodo = record
		elemento:celular;
		sig: piladatos;
	end;

	pila = record;
		datos: piladatos;
		cant: integer;
	end;

	procedure st_create(var p:pila);
	//crea una pila vacia y la devuelve en la variable P
	begin
		p.cant:= 0;
		p.datos:= nil;
	end;

	procedure st_push(var p:pila; elem:celular);
	//agrega al tope de la pila P ele elemento elem. La pila P debe estar creada
	var
		aux: piladatos;
	begin
		new(aux);
		asignar(aux^.elemento,elem);
		if(p.datos = nil)then	
			aux^.sig:= nil;
		else begin
			aux^.sig:= p.datos;
		p.datos:= aux;
		p.cant:= p.cant+1;
	end;

	procedure st_pop(var p:pila; var elem:celular);
	//devuelve el elemento en elem al tope de la pila P. La pila P debe tener elementos
	var
		aux: piladatos;
	begin
		asignar(elem,p.datos^.elemento);
		aux:= p.datos;
		p.datos:= p.datos^.sig;
		dispose(aux);
		p.cant:= p.cant-1;
	end;

	procedure st_top(p: pila; var elem:celular);
	//devuelve el elemento en elem al tope de la pila P, sin sacarlo dela pila. La pila P debe tener elementos
	begin
		asignar(elem,p.datos^.elemento);
	end;

	function st_lenght(p: pila): integer;
	//devuelve la cantidad de elementos de la pila P. La pila debe estar creada
	begin
		st_lenght:= p.cant;
	end;

	function st_empty(p: pila): boolean;
	//devuelve true si la pila tiene al menos un elemento, y false si esta vacia. La pila P debe estar creada
	begin
		st_empty:= (p.cant=0);
	end;
///////////
/////////// archivo diferente
///////////
program ejemplo;
uses tipoPila;
var
	p:pila;
	ele:celular;
	titu, mode: string;
	año, num: string;
begin
	//creacion
	read(titu,mode);
	read(año,num);
	st_create(p);
	while(titu <> "XXX")do begin
		crear(ele,titu,mode,año,num)//operacion del tad TipoCelular
		st_push(p,ele);
		read(titu,mode);
		read(año,num);
	end;
	//recorrido
	while(not st_empty(p))do begin
		st_pop(p,ele);
		write(consultarNumero(ele));//operacion del tad TipoCelular
	end;
end.