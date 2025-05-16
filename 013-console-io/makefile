console1: console1.o
	gcc -g -o console1 console1.o -no-pie
console1.o: console1.asm
	nasm -f elf64 -g -F dwarf console1.asm -l console1.lst

console2: console2.o
	gcc -g -o console2 console2.o -no-pie
console2.o: console2.asm
	nasm -f elf64 -g -F dwarf console2.asm -l console2.lst
