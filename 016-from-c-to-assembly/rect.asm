; rect.asm
section .data										
section .bss							
section .text

global rarea
rarea:
section .text
	mov	rax, rdi	
	imul	rsi
	ret									

global rcircum
rcircum:	
section .text	
	mov	rax, rdi
	add	rax, rsi
	imul	rax, 2
	ret
