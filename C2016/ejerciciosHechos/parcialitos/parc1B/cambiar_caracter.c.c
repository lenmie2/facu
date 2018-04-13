char cambiar_caracter(char m)
{
	if ((m<=97) && (m>=122)) {m-32;}
	else if ((m<=65) && (m>=90)){m+32;}

	return m;
}
