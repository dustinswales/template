F90      = gfortran
F90FLAGS = -Dstandalone -fdefault-real-8 -fdefault-double-8
# NETCDF
NC_INC   = -I$(NFHOME)/include
NC_LIB   = -L$(NFHOME)/lib
LDFLAGS += $(NC_LIB) -lnetcdff

SRC=machine.F90 driver.F90
OBJ=machine.o driver.o

%.o: %.F90
	$(F90) $(F90FLAGS) -c $(SRC)

%: %.o
	$(F90) $(F90FLAGS) -o $@ $^ $(LDFLAGS)

offline_driver:
	make driver

clean:
	@rm -f *.mod *.o driver

# Offline driver
driver.o  : machine.o
