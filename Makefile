CC = /bin/gcc

#GHDL = /bin/ghdl
GHDL = ghdl
GHDLFLAGS = #-g -v
GHDLRUNFLAGS = 

VHDL = hello_world.vhd

LIBS = work
LIBOBJS = $(patsubst %, %-lib93.cf, $(LIBS))

TOP = hello_world
UNITS = $(TOP)
OBJS = $(patsubst %, %.o, $(UNITS))

PWD = $(shell pwd)

CLEAN = $(TOP) *.cf *.o
IGNORE = $(CLEAN)

.PHONY: all clean run .gitignore
all: clean $(OBJS)

%.cf:
	$(GHDL) -a $(GHDLFLAGS) $(VHDL)

%.o: | %.cf
	$(GHDL) -c $(GHDLFLAGS) -e $(patsubst %.o,%,$@)

run: $(TOP)
	$(PWD)/$(TOP) $(GHDLRUNFLAGS)

clean:
	rm -rvf $(CLEAN)

.gitignore:
	rm $@
	for pat in $(IGNORE); do echo $$pat >> $@; done
