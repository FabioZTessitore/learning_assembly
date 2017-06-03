CC=gcc
CFLAGS=-g -Wall -ansi -pedantic

driver: driver.o loop.o
	$(CC) -m32 driver.o loop.o -o driver

driver.o: driver.c
	$(CC) $(CFLAGS) -m32 -c driver.c -o driver.o

loop.o: loop.asm
	nasm -f elf32 loop.asm -o loop.o -l loop.lst

.PHONY: clean
clean:
	rm -f *.o *.lst driver
