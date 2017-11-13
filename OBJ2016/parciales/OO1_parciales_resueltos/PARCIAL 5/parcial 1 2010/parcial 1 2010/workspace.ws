| cia linea1 linea2|

cia := Compania new.

linea1 := Linea newCompania: cia.
linea1 credito: 100.

linea2:= Linea newCompania: cia.
linea2 credito: 100.

linea1 agregarAmiga: linea2.

cia realizarComunicacionDesde: linea1 hacia: linea2 conDuracion: 10.
linea1 credito.

