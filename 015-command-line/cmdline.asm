extern printf
section .data
        msg db "The command and arguments: ",10,0
        fmt db "%s",10,0
section .bss
section .text
global main
main:
        ; prologue
        push rbp
        mov rbp, rsp

        mov r12, rdi            ; number of arguments
        mov r13, rsi            ; address of arguments array

        ; print the title
        mov rdi, msg
        call printf

        mov r14, 0
        ; print the command and arguments
.ploop:
        mov rdi, fmt
        ; the 8 refers to the length of the addresses pointed to
        ; 8 bytes x 8 bits = 64-bit address
        mov rsi, qword [r13 + r14 * 8]
        call printf
        inc r14
        cmp r14, r12
        jl .ploop

        ; epilogue
        leave
        ret
