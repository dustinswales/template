#!/bin/tcsh

module purge
echo "Loading GNU and NetCDF"
module load gnu/14.2.0
module load netcdf/4.9.2

setenv NFHOME /apps/netcdf/4.9.2/gnu_13.2.0_seq/
