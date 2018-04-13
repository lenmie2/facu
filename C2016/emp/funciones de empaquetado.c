 int emp_upack(const char *arg_upack, const char *arg_input, const char *arg_outputdir)	//Por el momento solo desempaqueta en la misma carpeta
{
	char c;
	char* campo[128] = "";
	unsigned char buffer[4096] = "";
	int ok = 0;contador = 0;i = 0;x = 0;
	emp_main_hd_t* headerMain;
	emp_file_hd_t* headerFile;
	FILE* in,out;


	
	in = fopen(arg_input,"rb");	//Abro el archivo emp
	out_main_hd(headerMain,in);	//Obtengo el registro principal

	while (i < strlen(arg_upack)) do
	{
		do
		{
			strcat(campo,arg_upack[i++]);

		} while (i < strlen(arg_upack) && (c != '$');	//Obtengo el primer nombre del archivo que quiero sacar

		i++;
		out_file_hd(headerFile,in); //Obtengo el registro de un archivo dentro del emp

		if ((strcmp(campo,headerFile.path) != 0) //Comparo si es igual al que quiero desempaquetar
		{
			out = fopen(campo,"wb");

			for (int x = 0; x < headerFile.fsize; ++x)
			{
			    fread(buffer, 1, headerFile.fsize, in);		//Copio el archivo a retirar
			    fwrite(buffer, 1, headerFile.fsize, out);

			    contador = 1;
			}

			fclose(out);				 
		}	
	}

	fclose(in);
	return contador;
}

int emp_uapack(const char *arg_input, const char *arg_outputdir)//Por el momento solo desempaqueta en la misma carpeta
{
	char c;
	char* campo[128] = "";
	unsigned char buffer[8192];
	int ok = 0;contador = 0;i = 0;
	emp_main_hd_t* headerMain;
	emp_file_hd_t* headerFile;
	FILE* in,out;

	
	in = fopen(arg_input,"rb");	//Abro el archivo emp
	out_main_hd(headerMain,in);	//Obtengo el registro principal

	while (i < strlen(arg_upack)) do
	{

		out_file_hd(headerFile,in); //Obtengo el registro de un archivo dentro del emp
		out = fopen(headerFile.path,"wb");

			for (int i = 0; i < headerFile.fsize; ++i)
			{
			    fread(buffer, 1, headerFile.fsize, in);		//Copio el archivo a retirar
			    fwrite(buffer, 1, headerFile.fsize, out);
			}
			contador++;
			fclose(out);	
	}

	fclose(in);
	return contador;
}

int emp_list(const char *arg_list, const char *arg_input);