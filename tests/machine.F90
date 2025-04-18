! This contains the working precision of the host/driver.
module machine
  implicit none
  integer, parameter :: kind_sngl_prec = 4
  integer, parameter :: kind_dbl_prec = 8

! Physics single precision flag
#ifndef SINGLE_PREC
  integer, parameter :: kind_phys = kind_dbl_prec
#else
  integer, parameter :: kind_phys = kind_sngl_prec
#endif
  integer, parameter :: kind_io8 = kind_phys

end module machine
