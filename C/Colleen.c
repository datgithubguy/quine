#include <stdio.h>
/*
	e
*/
void foo(void){;}
char *format = "#include <stdio.h>%c/*%c	e%c*/%cvoid foo(void){;}%cchar *format = %c%s%c;int main(){%c/*%c	d%c*/%cfoo();%cprintf(format, 10, 10, 10, 10, 10, 34, format, 34, 10, 10, 10, 10, 10, 10);}%c";int main(){
/*
	d
*/
foo();
printf(format, 10, 10, 10, 10, 10, 34, format, 34, 10, 10, 10, 10, 10, 10);}
