cmdline: cmdline.o
	gcc -g -o cmdline cmdline.o -no-pie
cmdline.o: cmdline.asm
	nasm -f elf64 -g -F dwarf cmdline.asm -l cmdline.lst
