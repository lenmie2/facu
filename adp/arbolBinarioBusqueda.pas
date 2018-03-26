program arbolEnteros;
type
	elemento = integer; //puede variar, pero tiene que se de tipo ordinal

	arbol = ^nodo;
	nodo = record
		izq: arbol;
		der: arbol;
		ele: elemento;
	end;

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
		if (dato < a^.elem) then insertar(a^.izq,dato)
							else insertar(a^.der,dato);
end;

procedure enOrden(var a: arbol);
begin
	if(a <> nil) then begin
		if(a^.izq <> nil) then
			enOrden(a^.izq);
		write(a^.ele);
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

procedure buscar(a:arbol ;dato: integer): arbol;
begin
	if(a = nil) then buscar:= nil
	else if(dato = a^.ele) then buscar:= a
	else if(dato < a^.ele) then buscar:= buscar(a^.izq,dato);
	else then buscar:= buscar(a^.der,dato);
end;
