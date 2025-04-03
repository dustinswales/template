FC       = gfortran
FCFLAGS  = -Dstandalone -fdefault-real-8 -fdefault-double-8
# NETCDF
#NC_INC   = -I$(NFHOME)/include
#NC_LIB   = -L$(NFHOME)/lib
FCFLAGS += -lnetcdff
#LDFLAGS += $(NC_LIB) -lnetcdff

SRC=machine.F90 driver.F90
OBJ=machine.o driver.o

%.o: %.F90
	$(FC) $(FCFLAGS) -c $(SRC)

driver: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

clean:
	@rm -f *.mod *.o driver
