!===========================
! date_and_time   
!==========================    
    implicit none
    real::randv=0.0
    integer,dimension(8)::va!any varible name are ok
    call DATE_AND_TIME (values=va)
    print'(8i5)',va
    !value1, year. 2,month! 3,date! 4,time difference with UTC in minuts! 5, hours! 6, minuts! 7,seconds! 8, milliseconds
    end
!===========================
!integer allocatable dimension
!===========================
!implicit none
!     integer,dimension(2,2)::A     !one dimension
!     integer,allocatable::B(:)   !multiple dimension
!     integer::i,j
!     do i=1,2
!     do j=1,2
!     A(i,j)=i
!     enddo
!     enddo
!     !do i=1,2
!     !do j=1,2
!     !B(i,j)=i
!     !enddo
!     !enddo
!     !
!     B=(/1,2,3,4/)
!     
!     !do i=1,4
!     !    do j=1,4             
!     !     B(i,j)=i+j
!     !    enddo
!     !enddo
!    
!    end
    
 
    
     !   integer,allocatable::seed(:)

    ! integer,dimension(:)::seed(:)
    !
    !integer::n=10
    !integer::a
    !!real*8::a
    !
    !call RANDOM_SEED(size=a)
    !write (*, *) seed
    !
    !allocate(seed(a))
    !write (*, *) seed
    !
    !call RANDOM_SEED(put=seed)    
    !write (*, *) seed
    !
    !call RANDOM_SEED(get=seed)    
    !write (*, *) seed
    
   