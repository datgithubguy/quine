global start
extern _printf
extern _exit
section .data
hello:	db "global start%1$cextern _printf%1$cextern _exit%1$csection .data%1$chello:	db %2$c%3$s%2$c, 0%1$csection .text%1$c;%1$c	; another%1$c;%1$cstart:%1$c;%1$c	; comment%1$c;%1$cmov rdi, hello%1$cmov rsi, 10%1$cmov rdx, 34%1$cmov rcx, hello%1$ccall _printf%1$c%1$ccall _olol%1$cmov rdi, 0%1$ccall _exit%1$c_olol:%1$c", 0
section .text
;
	; another
;
start:
;
	; comment
;
mov rdi, hello
mov rsi, 10
mov rdx, 34
mov rcx, hello
call _printf

call _olol
mov rdi, 0
call _exit
_olol:
