extern printf
section .data
        ; BEST PRACTICES:
        ;
        ; The function arguments, pi and radius, are located in memory. This is
        ; OK for now, but it is better to use registers and the stack to store
        ; function arguments. Using memory variables to pass on values to
        ; functions can create naming conflicts between values used in main and
        ; in functions and can make your code "less" portable.
        radius dq 10.0
        pi     dq 3.14
        fmt    db "The area of the circle is %.2f",10,0
section .bss
section .text
global main
main:
        push rbp
        mov rbp, rsp
        call area               ; call the function
        mov rdi, fmt            ; print format
        movsd xmm1, [radius]    ; move float to xmm1
        mov rax, 1              ; area in xmm0
        call printf
        ; NEW INSTRUCTION PRESENTED BY THE BOOK!
        ;
        ; This instruction does the same as mov rsp, rbp, and pop rbp (the
        ; epilogue)
        leave
        ret

area:
        push rbp
        mov rbp, rsp
        movsd xmm0, [radius]    ; move float (radius) to xmm0
        mulsd xmm0, [radius]    ; multiply xmm0 by float (radius)
        mulsd xmm0, [pi]        ; multiply xmm0 by float (pi)
        ; RETURN A VALUE FROM A FUNCTION
        ;
        ; If you return a value from a function, you use xmm0 for floating-point
        ; values and use rax for other values, such as integers or addresses.
        leave
        ret
        
