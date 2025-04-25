jump: jump.o
	gcc -o jump jump.o -no-pie
jump.o: jump.asm
	nasm -f elf64 -g -F dwarf jump.asm -l jump.lst

# =================================

jumploop: jumploop.o
	gcc -o jumploop jumploop.o -no-pie
jumploop.o: jumploop.asm
	nasm -f elf64 -g -F dwarf jumploop.asm -l jumploop.lst

# =================================

betterloop: betterloop.o
	gcc -o betterloop betterloop.o -no-pie
betterloop.o: betterloop.asm
	nasm -f elf64 -g -F dwarf betterloop.asm -l betterloop.lst
