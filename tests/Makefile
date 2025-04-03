F90      = gfortran
F90FLAGS = -Dstandalone -fdefault-real-8 -fdefault-double-8
# NETCDF

NC_INC   = -I$(NFHOME)/include
NC_LIB   = -L$(NFHOME)/lib
LDFLAGS += $(NC_LIB) -lnetcdff
F90FLAGS+= $(NC_INC)

SRC_PATH = ../
VPATH    = $(SRC_PATH)

OBJ=machine.o scheme.o

%.o: %.F90
	$(F90) $(F90FLAGS) -c $<

%: %.o
	$(F90) $(F90FLAGS) -o $@ $^ $(OBJ) $(LDFLAGS)

offline_driver:
	make driver

clean:
	@rm -f *.mod *.o driver

# Offline driver
scheme.o : machine.o
driver.o : machine.o scheme.o
driver   : driver.o
