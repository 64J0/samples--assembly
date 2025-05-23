sse_unaligned: sse_unaligned.o
	gcc -o sse_unaligned sse_unaligned.o -no-pie
sse_unaligned.o: sse_unaligned.asm
	nasm -f elf64 -g -F dwarf sse_unaligned.asm -l sse_unaligned.lst

sse_aligned: sse_aligned.o
	gcc -o sse_aligned sse_aligned.o -no-pie
sse_aligned.o: sse_aligned.asm
	nasm -f elf64 -g -F dwarf sse_aligned.asm -l sse_aligned.lst
