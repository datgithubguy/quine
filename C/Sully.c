#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define Q(x) char*s=#x;x
int i = 5;
Q(char *name;char *name_f;int main(){ if(!strcmp(__FILE__, "Sully.c"))i++; i--; if (i < 0) return 0; asprintf(&name, "Sully_%d", i); asprintf(&name_f, "Sully_%d.c", i); fprintf(fopen(name_f, "w"), "#include <stdio.h>%c#include <stdlib.h>%c#include <string.h>%c#define Q(x) char*s=#x;x%cint i = %d;%cQ(%s)\n", 10, 10, 10, 10, i, 10, s); char *str; asprintf(&str, "gcc -o %s %s && ./%s &", name, name_f, name); system(str); })
