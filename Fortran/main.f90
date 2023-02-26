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
        integer :: i

        open(unit=9,file="data.txt",action="write")
        do i = 1, size(htab)
            write(9, *) htab(i)
        end do
        close(9)

        open(unit=10,file="data_plot.gnu",action="write")
           write(10, *) 'reset'
           write(10, *) "set terminal pngcairo dashed enhanced size 480,360 font 'arial,12' fontscale 1.0"
           write(10, *) "set encoding utf8"
           write(10, *) "set output 'plot.png'"
           write(10, *) 'set xlabel "Nombre de rebonds'
           write(10, *) 'set ylabel "Hauteur"'
           write(10, *) "set title 'Hauteur de chaques rebonds'"
           write(10, *) 'plot "./data.txt"'
        close(10)

        call system("gnuplot data_plot.gnu")

    end subroutine graph

end module

program main
    use Bounces
    implicit none

    real(kind=8), allocatable :: htab(:)
    real(kind=8), target :: b = 2

    htab = rebonds(b)
    call graph(htab)
end program
