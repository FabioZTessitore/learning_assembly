CC=gcc
CFLAGS=-g -Wall -ansi -pedantic

driver: driver.o maggiore.o
	$(CC) -m32 driver.o maggiore.o -o driver

driver.o: driver.c
	$(CC) $(CFLAGS) -m32 -c driver.c -o driver.o

maggiore.o: maggiore.asm
	nasm -f elf32 maggiore.asm -o maggiore.o -l maggiore.lst

.PHONY: clean
clean:
	rm -f *.o *.lst driver
