CC=gcc
CFLAGS=-g -Wall -ansi -pedantic

driver: driver.o register.o
	$(CC) -m32 driver.o register.o -o driver

driver.o: driver.c
	$(CC) $(CFLAGS) -m32 -c driver.c -o driver.o

register.o: register.asm
	nasm -f elf32 register.asm -o register.o -l register.lst

.PHONY: clean
clean:
	rm -f *.o *.lst driver
