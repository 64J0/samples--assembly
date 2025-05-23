cpu_avx: cpu_avx.o
	gcc -o cpu_avx cpu_avx.o -no-pie
cpu_avx.o: cpu_avx.asm
	nasm -f elf64 -g -F dwarf cpu_avx.asm -l cpu_avx.lst

avx_unaligned: avx_unaligned.o
	gcc -o avx_unaligned avx_unaligned.o -no-pie
avx_unaligned.o: avx_unaligned.asm
	nasm -f elf64 -g -F dwarf avx_unaligned.asm -l avx_unaligned.lst
