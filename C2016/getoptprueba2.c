#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>

/* Flag set by ‘--verbose’. */
static int verbose_flag;

int
main (int argc, char **argv)
{
  int c;

  while (1)
    {
      static struct option long_options[] =
        {
          {"pack", required_argument, 0,'p'},
          {"unpack", required_argument, 0,'u'},
          {"repack",    required_argument,  0, 'r'},
          //{"unpack-all",  no_argument,1, 'a'},
          {"detail",  required_argument, 0, 'd'},
          {"list",  required_argument, 0, 'l'},
          {"input",    required_argument, 0, 'i'},
          {"output",    required_argument, 0, 'o'},
          {0, 0, 0, 0}
        };
      /* getopt_long stores the option index here. */
      int option_index = 0;

      int index;
      char* next;

      c = getopt_long (argc, argv, "p:u:r:ad:l:i:o:",
                       long_options, &option_index);

      /* Detect the end of the options. */
      if (c == -1)
        break;

      switch (c)
        {
        case 0:
          /* If this option set a flag, do nothing else now. */
          if (long_options[option_index].flag != 0)
            break;
          printf ("option %s", long_options[option_index].name);
          if (optarg)
            printf (" with arg %s", optarg);
          printf ("\n");
          break;

        case 'p':
          printf("option -p %s\n",optarg);
          break;

        case 'u':
          puts ("option -u\n");
          break;

        case 'r':
          index = optind-1;
          while (index < argc){
              next = strdup(argv[index]);
              index++;
              if (next[0] != '-')
                  printf("argumento %d de -r: %s\n",index,next);
              else 
                break;
          }
          break;

        /*case 'a':
          printf ("option -a with value `%s'\n", optarg);
          break;
        */
        case 'd':
          printf ("option -d with value `%s'\n", optarg);
          break;

        case 'l':
          printf ("option -l with value `%s'\n", optarg);
          break;

        case 'i':
          printf ("option -i with value `%s'\n", optarg);
          break;

        case 'o':
          printf ("option -o with value `%s'\n", optarg);
          break;

        case '?':
          /* getopt_long already printed an error message. */
          break;

        default:
          abort ();
        }
    }

  /* Instead of reporting ‘--verbose’
     and ‘--brief’ as they are encountered,
     we report the final status resulting from them. */
  if (verbose_flag)
    puts ("verbose flag is set");

  /* Print any remaining command line arguments (not options). */
  if (optind < argc)
    {
      printf ("non-option ARGV-elements: ");
      while (optind < argc)
        printf ("%s ", argv[optind++]);
      putchar ('\n');
    }

  exit (0);
}