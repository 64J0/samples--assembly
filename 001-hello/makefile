# hello world
hello: hello.o
	gcc -o hello hello.o -no-pie
hello.o: hello.asm
	nasm -f elf64 -g -F dwarf hello.asm -l hello.lst

# ================================
# hello world with final break line
hello2: hello2.o
	gcc -o hello2 hello2.o -no-pie
hello2.o: hello2.asm
	nasm -f elf64 -g -F dwarf hello2.asm -l hello2.lst

# ================================
# hello world with another way to print final break line
hello3: hello3.o
	gcc -o hello3 hello3.o -no-pie
hello3.o: hello3.asm
	nasm -f elf64 -g -F dwarf hello3.asm -l hello3.lst
