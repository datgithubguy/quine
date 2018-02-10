global start
extern _fprintf
extern _exit
extern _fopen
extern _system
extern _sprintf
extern _memcpy
extern _strcmp

section .bss
name_exec: resb 16
name_src: resb 16
strname: resb 16
command_compile_run: resb 101

section .data
format_full_file: db "global start%1$cextern _fprintf%1$cextern _exit%1$cextern _fopen%1$cextern _system%1$cextern _sprintf%1$cextern _memcpy%1$cextern _strcmp%1$c%1$csection .bss%1$cname_exec: resb 16%1$cname_src: resb 16%1$cstrname: resb 16%1$ccommand_compile_run: resb 101%1$c%1$csection .data%1$cformat_full_file: db %2$c%3$s%2$c, 0%1$c%1$cformat_command: db %2$c%4$s%2$c, 0%1$ci: dd %5$d%1$cformat_exec: db %2$c%%s_%%d%%c%2$c, 0%1$cformat_src: db %2$c%%s.s%2$c, 0%1$cread: db %2$cw+%2$c, 0%1$cname_file: db __FILE__, 0%1$cname_first_file: db %2$cSully.s%2$c, 0%1$cname_first_decrement: db %2$cSully_5.s%2$c, 0%1$c%1$csection .text%1$cstart:%1$c%1$cpush rbp%1$cxor rax, rax%1$clea rdi, [rel strname]%1$clea rsi, [rel name_file]%1$cmov rdx, 5%1$ccall _memcpy%1$c%1$cxor rax, rax%1$clea rdi, [rel name_file]%1$clea rsi, [rel name_first_file]%1$ccall _strcmp%1$c%1$cmov rdi, 0%1$ccmp rdi, rax%1$cje dont_decrement_i%1$c%1$cxor rax, rax%1$clea rdi, [rel name_file]%1$clea rsi, [rel name_first_decrement]%1$ccall _strcmp%1$cmov rdi, 0%1$ccmp rdi, rax%1$cje dont_decrement_i%1$cdec byte [rel i]%1$cdont_decrement_i:%1$c%1$cxor rax, rax%1$clea rdi, [rel name_exec]%1$clea rsi, [rel format_exec]%1$clea rdx, [rel strname]%1$cmov rcx, [rel i]%1$cmov r8, 0%1$ccall _sprintf%1$c%1$cxor rax, rax%1$clea rdi, [rel name_src]%1$clea rsi, [rel format_src]%1$clea rdx, [rel name_exec]%1$ccall _sprintf%1$c%1$cxor rax, rax%1$clea rdi, [rel command_compile_run]%1$clea rsi, [rel format_command]%1$clea rdx, [rel name_src]%1$clea rcx, [rel name_exec]%1$cmov r8, 0%1$ccall _sprintf%1$c%1$cxor rax, rax%1$clea rdi, [rel name_src]%1$clea rsi, [rel read]%1$ccall _fopen%1$c%1$cmov rdi, rax%1$cmov rsi, format_full_file%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, format_full_file%1$clea r9, [rel format_command]%1$cmov r10, i%1$ccall _fprintf%1$c%1$cxor rax, rax%1$c;lea rdi, [rel command_compile_run]%1$c;call _system%1$c%1$cmov rdi, 0%1$ccall _exit%1$c", 0
format_command: db "nasm -f macho64 %1$s && ld -macosx_version_min 10.7.0 -lSystem -o %2$s %2$s.o && ./%2$s &%3$c", 0
i: dd 15
format_exec: db "%s_%d%c", 0
format_src: db "%s.s", 0
read: db "w+", 0
name_file: db __FILE__, 0
name_first_file: db "Sully.s", 0
name_first_decrement: db "Sully_5.s", 0

section .text
start:

push rbp
; mov	rbp, rsp	; rbp is callers stack
; push	rdx		; save registers
; push	rdi
; push	rsi

xor rax, rax
lea rdi, [rel strname]
lea rsi, [rel name_file]
mov rdx, 5
call _memcpy

xor rax, rax
lea rdi, [rel name_file]
lea rsi, [rel name_first_file]
call _strcmp

mov rdi, 0
cmp rdi, rax
je dont_decrement_i

xor rax, rax
lea rdi, [rel name_file]
lea rsi, [rel name_first_decrement]
call _strcmp
mov rdi, 0
cmp rdi, rax
je dont_decrement_i
dec byte [rel i]
dont_decrement_i:

xor rax, rax
lea rdi, [rel name_exec]
lea rsi, [rel format_exec]
lea rdx, [rel strname]
mov rcx, [rel i]
mov r8, 0
call _sprintf

xor rax, rax
lea rdi, [rel name_src]
lea rsi, [rel format_src]
lea rdx, [rel name_exec]
call _sprintf

xor rax, rax
lea rdi, [rel command_compile_run]
lea rsi, [rel format_command]
lea rdx, [rel name_src]
lea rcx, [rel name_exec]
mov r8, 0
call _sprintf

xor rax, rax
lea rdi, [rel name_src]
lea rsi, [rel read]
call _fopen

pop rbp

push qword rbp
mov rbp, rsp
;and rsp, 0xfffffff
sub rsp, 16
xor rsi, rsi
;lea rsi, [rel i]
mov qword rsi, qword i
;and rsi, 0xfff
;mov rsi, [rel rsi]
;mov qword rsi, [rel i]
mov qword [rel rbp - 16], rsi
;mov word [rel rbp - 0x8], [rel i]
;push word [rel i]
; mov rsi, qword i
; push qword [rel rsi]
mov rdi, rax
mov rsi, format_full_file
mov rdx, 10
mov rcx, 34
mov r8, format_full_file
lea r9, [rel format_command]

call _fprintf
add rsp, 16
; pop rbp
; ret

;add rsp, 4


xor rax, rax
lea rdi, [rel command_compile_run]
call _system

; pop	rsi		; restore registers
; pop	rdi		; in reverse order
; pop	rdx
; mov	rsp,rbp		; restore callers stack frame
; pop	rbp

mov rdi, 0
call _exit
