 PROGRAM main
  IMPLICIT NONE
  INTEGER, DIMENSION(:,:,:), ALLOCATABLE :: array
  integer::a,b,c,d
  ALLOCATE (array(2,3,4))
  a=size(array,1) 
  b=size(array,2)
  c=size(array,3)
  d=size(array)
  array=1.0
 ! array = transpose(reshape((/ 1, 2, 3, 4, 5, 6 /),(/ size(array, 2), size(array, 1)/))) 
    

  DEALLOCATE (array)
print*,'hello'
END PROGRAM main  