unit arbolBinarioBusquedaEnteros;
interface
	//el type aparece como "type exportado en ADTs porque en teoria no se deberia ver la implementacion"
	//en unit, va declarado en interface
	type
		elemento = integer; //puede variar, pero tiene que se de tipo ordinal

		arbol = ^nodo;
		nodo = record
			izq: arbol;
			der: arbol;
			ele: elemento;
		end;

	procedure creacion(var a:arbol);

	procedure insertar(var a: arbol; dato:elemento);

	procedure enOrden(var a: arbol);

	procedure postOrden(var a:arbol);

	procedure preOrden(var a:arbol);

	function buscar(a:arbol ;dato: integer): arbol;	

implementation

	procedure creacion(var a:arbol);
	begin
		a:= nil;
	end;

	procedure insertar(var a: arbol; dato:elemento);
	begin
		if(a = nil) then begin
			new(a);
			a^.ele:= dato;
			a^.izq:= nil;
			a^.der:= nil;
		end
		else
			if (dato < a^.ele) then insertar(a^.izq,dato)
								else insertar(a^.der,dato);
	end;

	procedure enOrden(var a: arbol);
	begin
		if(a <> nil) then begin
			if(a^.izq <> nil) then
				enOrden(a^.izq);
			writeln(a^.ele);
			if(a^.der <> nil) then
				enOrden(a^.der);
		end;
	end;

	procedure postOrden(var a:arbol);
	begin
		if(a <> nil) then begin
			postOrden(a^.izq);
			postOrden(a^.der);
			writeln(a^.ele);
		end;
	end;

	procedure preOrden(var a:arbol);
	begin
		if(a <> nil) then begin
			writeln(a^.ele);
			preOrden(a^.izq);
			preOrden(a^.der);
		end;
	end;

	function buscar(a:arbol ;dato: integer): arbol;
	begin
		if(a = nil) then buscar:= nil
		else if(dato = a^.ele) then buscar:= a
		else if(dato < a^.ele) then buscar:= buscar(a^.izq,dato)
		else buscar:= buscar(a^.der,dato);
	end;
END.
