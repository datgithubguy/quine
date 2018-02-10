global start
extern _fprintf
extern _exit
extern _fopen
section .data
hello:	db "global start%1$cextern _fprintf%1$cextern _exit%1$cextern _fopen%1$csection .data%1$chello:	db %2$c%3$s%2$c, 0%1$cfilename: db %2$cGrace_kid.s%2$c, 0%1$cread: db %2$cw+%2$c, 0%1$csection .text%1$cstart:%1$cxor rax, rax%1$clea rdi, [rel filename]%1$clea rsi, [rel read]%1$ccall _fopen%1$cmov rdi, rax%1$cmov rsi, hello%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, hello%1$ccall _fprintf%1$cmov rdi, 0%1$ccall _exit%1$c", 0
filename: db "Grace_kid.s", 0
read: db "w+", 0
section .text
start:
push rbp
xor rax, rax
lea rdi, [rel filename]
lea rsi, [rel read]
call _fopen
mov rdi, rax
mov rsi, hello
mov rdx, 10
mov rcx, 34
mov r8, hello
call _fprintf
mov rdi, 0
call _exit
