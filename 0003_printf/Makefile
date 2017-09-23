CC=gcc
CFLAGS=-g -Wall -ansi -pedantic

driver: driver.o puts.o
	$(CC) -m32 driver.o puts.o -o driver

driver.o: driver.c
	$(CC) $(CFLAGS) -m32 -c driver.c -o driver.o

puts.o: puts.asm
	nasm -f elf32 puts.asm -o puts.o -l puts.lst

.PHONY: clean
clean:
	rm -f *.o *.lst driver
