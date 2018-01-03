! CALL GET_COMMAND(LENGTH=l1, STATUS=stat) LENGTH means this code in the direction name's length
!PRINT "('The command line was:',A)"
!initial, print logical type    
 !INTEGER, DIMENSION(:,:), ALLOCATABLE :: array 
 !   => ALLOCATE (array(2,3))   
    
PROGRAM ByYourCommand
  IMPLICIT NONE
  CHARACTER(:), ALLOCATABLE :: full_command_line,b1
  CHARACTER(:), ALLOCATABLE :: a_single_argument
  INTEGER :: l,c=10
  INTEGER :: stat
  logical::e1,e2
  e1=.true.
  e2=.false.
print"('logical is:',l,l)",e1,e2  
PRINT "('integer is :',I4.4)",C! full_command_line
  !CHARACTER(5) :: cmd
  !CALL get_command(cmd)
  !WRITE (*,*) TRIM(cmd)  
  
  !CALL GET_COMMAND([COMMAND, LENGTH, STATUS])
  
  !****
  CALL GET_COMMAND(LENGTH=l, STATUS=stat)!LENGTH means this code in the direction name's length
  !, STATUS=stat
 ! full_command_line='aaaaaaaaaa'
  IF (stat > 0) THEN
    STOP "Sorry, but I couldn't retrieve the command line"
  END IF
  
  IF (l == 0) THEN
    STOP "Sorry, but I couldn't work out the command length"
  END IF
  
  ALLOCATE(CHARACTER(l) :: full_command_line)!l=57 'gram Files (x86)\IntelSWTools\compilers_and_libraries_201
  ALLOCATE(CHARACTER(l) :: b1)
  ! ALLOCATE(CHARACTER(30) :: full_command_line)
  CALL GET_COMMAND(COMMAND=full_command_line)!, STATUS=stat
  
  IF (stat /= 0) THEN
    STOP 'Sorry, but GET_COMMAND failed unexpectedly'
  END IF

PRINT "('The command line was:',A)", full_command_line  
  IF (COMMAND_ARGUMENT_COUNT() == 0) THEN
    STOP "There were no command arguments"
  END IF
  
  CALL GET_COMMAND_ARGUMENT(1, LENGTH=l, STATUS=stat)
  IF (stat > 0) THEN
    STOP "Sorry, but I couldn't retrieve the first command argument"
  END IF
  
  IF (l == 0) THEN
    STOP "Sorry, but I couldn't work out the length of the first argument"
  END IF
  
  ALLOCATE(CHARACTER(l) :: a_single_argument)
  CALL GET_COMMAND_ARGUMENT(1, VALUE=a_single_argument, STATUS=stat)
  IF (stat /= 0) THEN
    STOP 'Sorry, but GET_COMMAND_ARGUMENT failed unexpectedly'
  END IF
  PRINT "('The first argument was:',A)", a_single_argument
  
END PROGRAM ByYourCommand