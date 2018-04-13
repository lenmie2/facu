#include <time.h>
#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    time_t current_time;
    char* c_time_string;

    /* Obtain current time. */
    current_time = time(NULL);


    c_time_string = ctime(&current_time);

    /* Print to stdout. ctime() has already added a terminating newline character. */
    (void) printf("Current time is %s", c_time_string);
    exit(EXIT_SUCCESS);
}
/*#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <time.h>

int main(int argc, char const *argv[])
{

	struct stat estatus;
	struct tm tiempo;
	stat(argv[1],&estatus);
	
    printf("Informacion para %s\n",argv[1]);
    printf("---------------------------\n");
    printf("Tamaño del archivo: \t\t%d bytes\n",estatus.st_size);

    getdate
    printf("%s\n", );
    //printf("Ultimo acceso: %s\n", ctime(&estatus.st_mtim.tv_min));
	//printf("\tmtime: %s", ctime(&sb.st_mtim.tv_sec));

	return 0;
}*/