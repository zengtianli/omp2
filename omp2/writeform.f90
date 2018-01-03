!==============================================
! character::fname         !default of character size is 1// character(30)::fname size=30 
!  format(i5.2)  result is 01, format(i5.5) result is 00005   
!   fname='bcdddddd'  !only print b if character size is 1 
!status='new'=non exist ,'old'=exist    
!==============================================
    
PROGRAM main
  IMPLICIT NONE
  INTEGER, DIMENSION(:,:), ALLOCATABLE :: array
  integer::a,b,c,d,e
 ! character::fname         !default of character size is 1
  character(30)::fname     !10 means character size is 10
  ALLOCATE (array(2,3))
  a=size(array,1) 
  b=size(array,2)
 ! c=size(array,3)
  d=size(array)
  array=1.0
 ! array = transpose(reshape((/ 1, 2, 3, 4, 5, 6 /),(/ size(array, 2), size(array, 1)/))) 
  e=1
  
  write(fname,100),e
!2 format(i5.2)  !this 
!  write(fname,100),1
  
100 format('tianli\a',I5.5,'.dat')  
 ! Fname='aaaaaaaaaaaaaaaaaaaaaaaaa',e,'.dat'
! fname='bcdddddd'  !only print b 
  
OPEN(10, file='tianli\output2.dat', status='new')
!status='new'=non exist ,'old'=exist
CLOSE(10)

!OPEN(300,FILE=fname)
!write(300,*),'hello'
!write(300,200)array
!
!Close(300)
!!!!200 format(3i5.2)!1i5,2 means one column, 2i5,2 means 2 colume
  DEALLOCATE (array)
print*,'hello'
END PROGRAM main  