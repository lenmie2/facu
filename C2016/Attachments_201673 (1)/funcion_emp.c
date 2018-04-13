#include <string.h>

int emp_pack(const *arg_pack, const char *arg_output){
	char c;
	char* campo;  char campo[128] = "";
	int cont= 0,i = 0; 
	emp_main_hd_t* headerMain;
	emp_file_hd_t* headerFile;
	
	FILE *nArch, auxArch;
	nArch = fopen(arg_output,wb);
	init_main_hd(headerMain);
	in_main_hd(headerMain,nArch);

	campo= (char*)malloc(strlen(arg_pack));

	while (i < strlen(arg_pack){
		do {
			strcat(campo, arg_pack[i++]);
		}while ((arg_pack[i] != '$') && (i<strlen(arg_pack));

		if (arg_pack[i] == '$'){		
			init_file_hd(headerFile,campo);		//obtengo el largo del archivo a pegar y inicio el registro
			if (in_file_hd(headerFile,nArch,auxArch)==1)
				cont++;   //pego el registro en cuestion en el archivo nuevo y pego el archivo a pegar			
			campo = "";
			i++;
		}
	}

	return cont;
}
		
	
	
	
