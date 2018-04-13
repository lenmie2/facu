program usaArboles;
uses arbolBinarioBusquedaEnteros;
VAR
	a: arbol;
BEGIN
	creacion(a);
	insertar(a,5);
	insertar(a,1);
	insertar(a,6);
	insertar(a,5);
	insertar(a,8);
	insertar(a,4);
	enOrden(a);
END.
