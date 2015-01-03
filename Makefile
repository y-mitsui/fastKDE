CFLAGS=-Wall -g
ASFLAGS=-Wall -g
CC=gcc
LOADLIBES=-lm
ifneq   "$(CFLAGS)" "-DENABLE_ASM"
example: kde.o fgt.o fdrand48.o
else
example: kde.o fgt.o computeBuffer.o convolution.o fdrand48.o
endif
clean:
	rm *.o
	rm example
