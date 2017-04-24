CC=gcc
CFLAGS=-g -Wall -ansi -pedantic

driver: driver.o nothing.o
	$(CC) -m32 driver.o nothing.o -o driver

driver.o: driver.c
	$(CC) $(CFLAGS) -m32 -c driver.c -o driver.o

nothing.o: nothing.asm
	nasm -f elf32 nothing.asm -o nothing.o -l nothing.lst

.PHONY: clean
clean:
	rm -f *.o *.lst driver
