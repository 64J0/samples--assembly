section .data
        msg1     db "Hello, World!",10,0
        msg2     db "Your turn (only a-z): ",0
        msg3     db "You answered: ",0
        inputlen equ 10         ; length of inputbuffer
        NL       db 0xa
section .bss
        input resb inputlen+1   ; provide space for ending 0
section .text
global main

main:
        ; prologue
        push rbp
        mov rbp, rsp
        
        mov rdi, msg1           ; print first string
        call prints

        mov rdi, msg2           ; print second string
        call prints

        mov rdi, input
        mov rsi, inputlen
        call reads
        
        mov rdi, msg3           ;  print third string
        call prints

        mov rdi, input          ; print the inputbuffer
        call prints

        mov rdi, NL             ; print NL
        call prints

        ; epilogue
        leave
        ret

prints:
        push rbp
        mov rbp, rsp

        push r12                ; calee saved
        ; count characters
        xor rdx, rdx            ; length in rdx
        mov r12, rdi
.lengthloop:
        cmp byte[r12], 0
        je .lengthfound
        inc rdx
        inc r12
        jmp .lengthloop
.lengthfound:                   ; print the string, length in rdx
        cmp rdx, 0              ; no string (0 length)
        je .done
        mov rsi, rdi            ; rdi contains address of string
        mov rax, 1              ; 1 = write
        mov rdi, 1              ; 1 = stdout
        syscall
.done:
        pop r12
        leave
        ret

reads:
section .data
section .bss
        .inputchar resb 1
section .text
        push rbp
        mov rbp, rsp

        push r12                ; calee saved
        push r13                ; calee saved
        push r14                ; calee saved
        mov r12, rdi            ; address of inputbuffer
        mov r13, rsi            ; max length in r13
        xor r14, r14            ; character counter
.readc:
        mov rax, 0              ; read
        mov rdi, 1              ; stdin
        lea rsi, [.inputchar]   ; address of input
        mov rdx, 1              ; # of characters to read
        syscall
        mov al, [.inputchar]    ; char is NL?
        cmp al, byte[NL]
        je .done                ; NL => end
        cmp al, 97              ; lower than a?
        jl .readc               ; ignore it
        cmp al, 122             ; higher than z?
        jg .readc               ; ignore it
        inc r14                 ; inc counter
        cmp r14, r13
        ja .readc               ; buffer max reacher, ignore
        mov byte [r12], al      ; save the char in the buffer
        inc r12                 ; point to next char in buffer
        jmp .readc
.done:
        inc r12
        mov byte [r12], 0       ; add end 0 to inputbuffer
        pop r14                 ; callee saved
        pop r13                 ; calee saved
        pop r12                 ; calee saved
        
        leave
        ret
