module Bounces

    private
    public :: rebonds, graph

contains

    function rebonds(h) result(htab)
        implicit none

        real(kind=8),pointer,intent(in) :: h
        real(kind=8),allocatable :: htab(:)
        real(kind=8) :: dl
        integer :: i = 0

        i = 0
        dl = h
        do while (dl > 0.1)
           i = i + 1
           dl = dl * 0.75
        end do
        allocate(htab(i))

        dl = h
        do i = 1,size(htab)
           htab(i) = dl
           dl = dl * 0.75
        end do
    end function rebonds

    subroutine graph(htab)
        real(kind=8), allocatable :: htab(:)

        print *, "graph"
    end subroutine graph

end module

program main
    use Bounces
    implicit none

    real(kind=8), allocatable :: htab(:)
    real(kind=8), target :: b = 2

    htab = rebonds(b)
    call graph(htab)
    print *, htab
end program
