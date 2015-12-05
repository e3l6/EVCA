# Eric Laursen, 25 October 2015, CS 441-001 Term Project
# Makefile for Color - a K-colorability on N-region graph solution implementing
# Y. Takefuji, et al., solution from Neural Network Parallel Computing,
# chapter 3

PROG = evca

OBJS = evca.o bitman.o

.adb.o:
	gcc -c -gnat2012 $<

.SUFFIXES: .adb .o

$(PROG):	$(OBJS)
	gnatbind $(PROG).ali
	gnatlink $(PROG).ali

clean:
	rm *.o *.ali $(PROG)

tidy:
	rm *~
