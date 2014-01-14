CFLAGS=-Wall -g
ASFLAGS=-Wall -g
CC=gcc
LOADLIBES=-lm
example: kde.o fgt.o computeBuffer.o convolution.o
clean:
	rm *.o
	rm example
