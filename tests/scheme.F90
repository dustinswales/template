module scheme
  use machine, only: wp => kind_phys, sp => kind_sngl_prec, dp => kind_dbl_prec
  implicit none
  public :: scheme_run
contains
  
  subroutine scheme_run
    print*,'Running scheme...'
  end subroutine scheme_run

end module scheme
