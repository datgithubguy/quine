#include <stdio.h>
/*
	d
*/
#define A 1
#define S "#include <stdio.h>%c/*%c	d%c*/%c#define A 1%c#define S %c%s%c%c#define F() int main(){fprintf(fopen(%c%s%c, %c%s%c), S, 10, 10, 10, 10, 10, 34, S, 34, 10, 34, %c%s%c, 34, 34, %c%s%c, 34, 34, %cGrace_kid.c%c, 34, 34, %cw%c, 34, 34, 34, 34, 34, 10, 10);}%cF();%c"
#define F() int main(){fprintf(fopen("Grace_kid.c", "w"), S, 10, 10, 10, 10, 10, 34, S, 34, 10, 34, "Grace_kid.c", 34, 34, "w", 34, 34, "Grace_kid.c", 34, 34, "w", 34, 34, 34, 34, 34, 10, 10);}
F();
