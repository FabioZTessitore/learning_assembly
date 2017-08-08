CC=gcc
CFLAGS=-g -Wall -ansi -pedantic

driver: driver.o subroutine.o
	$(CC) -m32 driver.o subroutine.o -o driver

driver.o: driver.c
	$(CC) $(CFLAGS) -m32 -c driver.c -o driver.o

subroutine.o: subroutine.asm
	nasm -f elf32 subroutine.asm -o subroutine.o -l subroutine.lst

.PHONY: clean
clean:
	rm -f *.o *.lst driver
