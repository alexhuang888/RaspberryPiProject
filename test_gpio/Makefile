#DEBUG	= -g -O0
DEBUG	= -O3
IDIR = ../wiringPi/wiringPi
INCLUDE	= -I$(IDIR)
CC = gcc
CFLAGS = $(DEBUG) -Wall $(INCLUDE) -Winline -pipe

#ODIR = .obj
ODIR = .
#LDIR =../lib;/usr/local/lib
LDIR = .
LDFLAGS	= -L$(LDIR)
LDLIBS    = -lwiringPi -lwiringPiDev -lpthread -lm
SRCDIR = .

SRC = testgpio.cpp testwiringPi.cpp gpio.cpp

_DEPS = testwiringPi.h wiringPi.h gpio.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = testwiringPi.o testgpio.o gpio.o testwiringPiSoftPWM.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SRCDIR)/%.cpp $(DEPS)
	$(CC)  -c -o $(ODIR)/$@ $< $(CFLAGS) $(LDFLAGS) $(LDLIBS)
	
testgpio: testgpio.o gpio.o
	$(CC)  -o $@ $^  $(LDFLAGS) $(LDLIBS)

testwiringPi: testwiringPi.o
	$(CC)  -o $@ $^  $(LDFLAGS) $(LDLIBS)
	
testwiringPiSoftPWM: testwiringPiSoftPWM.o
	$(CC)  -o $@ $^  $(LDFLAGS) $(LDLIBS)
			
.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
