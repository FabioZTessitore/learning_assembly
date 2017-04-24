CC=gcc
CFLAGS=-g -Wall -ansi -pedantic

driver: driver.o printf.o
	$(CC) -m32 driver.o printf.o -o driver

driver.o: driver.c
	$(CC) $(CFLAGS) -m32 -c driver.c -o driver.o

printf.o: printf.asm
	nasm -f elf32 printf.asm -o printf.o -l printf.lst

.PHONY: clean
clean:
	rm -f *.o *.lst driver
