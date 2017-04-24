CC=gcc
CFLAGS=-g -Wall -ansi -pedantic

driver: driver.o scanf.o
	$(CC) -m32 driver.o scanf.o -o driver

driver.o: driver.c
	$(CC) $(CFLAGS) -m32 -c driver.c -o driver.o

scanf.o: scanf.asm
	nasm -f elf32 scanf.asm -o scanf.o -l scanf.lst

.PHONY: clean
clean:
	rm -f *.o *.lst driver
