program prueba;
type
	texto = file of text;

var 
    archivo: texto;
	numero:string[30];
    horas:integer;
begin
	assign(archivo,'C:\Intel\lol.txt');
	reset(archivo);
	readln(archivo,numero,horas);
	writeln(numero,'  ',horas);
	close(archivo);
end.
