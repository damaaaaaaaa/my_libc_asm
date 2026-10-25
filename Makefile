CC        = gcc
ASM       = nasm 
CFLAGS    = -Wall -Wextra 
ASMFLAGTS = -f elf64 
TARGET    = my_libc

all: $(TARGET)

$(TARGET): main.o my_libc.o 
	$(CC) main.o my_libc.o -o $(TARGET)

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o   
    
my_libc.o: src/my_libc.asm 
	$(ASM) $(ASMFLAGTS) src/my_libc.asm -o my_libc.o 
    
clean:
	rm -f *.o $(TARGET) 
