alive: alive.o
	gcc -o alive alive.o -no-pie
alive.o: alive.asm
	nasm -f elf64 -g -F dwarf alive.asm -l alive.lst

# =================================

hello4: hello4.o
	gcc -o hello4 hello4.o -no-pie
hello4.o: hello4.asm
	nasm -f elf64 -g -F dwarf hello4.asm -l hello4.lst

# =================================

alive2: alive2.o
	gcc -o alive2 alive2.o -no-pie
alive2.o: alive2.asm
	nasm -f elf64 -g -F dwarf alive2.asm -l alive2.lst
